Class {
	#name : #FASTJavaRWVariablesVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor',
		'builder'
	],
	#category : #'FAST-Java-Tools-Tests-resolver'
}

{ #category : #running }
FASTJavaRWVariablesVisitorTest >> nonLocalDeclaration: aName in: aNode [
	| decl |
	decl := FASTJavaNonLocalDeclaration new name: aName.
	decl resetLocalUses.

	aNode localDeclaration: decl.
	decl addLocalUse: aNode.
	
	^decl
]

{ #category : #running }
FASTJavaRWVariablesVisitorTest >> setUp [
	super setUp.
	
	builder := FASTJavaTestNodeBuilder new.
	visitor := FASTJavaRWVariablesVisitor new.
]

{ #category : #running }
FASTJavaRWVariablesVisitorTest >> testAssignementStatementComplexExpression [
	| node1 node2 node3 decl1 decl2 decl3 |
	node1 := builder var: 'x'	.
	decl1 := self nonLocalDeclaration: 'x' in: node1.
	
	node2 := builder var: 'y'	.
	decl2 := self nonLocalDeclaration: 'y' in: node2.

	node3 := builder assignement: 'a' value: (builder infix: '+' lhs: node1 rhs: node2).
	decl3 := self nonLocalDeclaration: 'a' in: node3.

	visitor on: (builder exprStatement: node3).

	self assertCollection: visitor variablesW hasSameElements: { decl3 }.
	self assertCollection: visitor variablesR hasSameElements: { decl1 . decl2 }
	
]

{ #category : #running }
FASTJavaRWVariablesVisitorTest >> testAssignementStatementConstant [
	| node decl |
	node := builder assignement: 'a' value: (builder literalInt: 5).
	decl := self nonLocalDeclaration: 'a' in: node.

	visitor on: (builder exprStatement: node).

	self assertCollection: visitor variablesW hasSameElements: { decl }.
	self assert: visitor variablesR isEmpty
	
]

{ #category : #running }
FASTJavaRWVariablesVisitorTest >> testIfStatement [
	"Note the visitor has information only for the condition of the IF
	 information for THEN/ELSE part must be treated inside the visitor
	 (#visitFASTJavaThenPartStatement: , #visitFASTJavaElsePartStatement:)"
	| node1 node2 decl1 decl2 |
	node1 := builder var: 'x'.
	decl1 := self nonLocalDeclaration: 'x' in: node1.

	node2 := builder var: 'y'.
	decl2 := self nonLocalDeclaration: 'y' in: node2.

	visitor on: (builder
		if: (builder infix: '>' lhs: node1 rhs: (builder literalInt: 0))
		then: (builder return: node2)
		else: nil).

	self assert: visitor variablesW isEmpty.
	self assertCollection: visitor variablesR hasSameElements: { decl1 }
	
]

{ #category : #running }
FASTJavaRWVariablesVisitorTest >> testReturnStatement [
	| node decl |
	node := builder var: 'a'.
	decl := self nonLocalDeclaration: 'a' in: node.

	visitor on: (builder return: node).

	self assert: visitor variablesW isEmpty.
	self assertCollection: visitor variablesR hasSameElements: { decl }.
	
]

{ #category : #running }
FASTJavaRWVariablesVisitorTest >> testVarDeclStatement [
	| node decl |
	node := builder declarator: 'a' init: nil.
	decl := self nonLocalDeclaration: 'a' in: node.

	visitor on: (builder varDeclarations: nil declarators: {node}).

	self assertCollection: visitor variablesW hasSameElements: { decl }.
	self assert: visitor variablesR isEmpty
	
]
