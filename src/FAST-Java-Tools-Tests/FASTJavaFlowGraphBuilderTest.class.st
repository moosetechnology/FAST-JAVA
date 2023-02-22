Class {
	#name : #FASTJavaFlowGraphBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'ifStmt',
		'declarationStmt',
		'returnStmt',
		'blockStmt',
		'infixExpr',
		'assignementExpr',
		'variableExpr',
		'nonLocalDeclaration'
	],
	#category : #'FAST-Java-Tools-Tests-flowgraph'
}

{ #category : #running }
FASTJavaFlowGraphBuilderTest >> setUp [
	super setUp.

	nonLocalDeclaration := FASTJavaNonLocalDeclaration new name: 'i'.

	variableExpr := FASTJavaVariableExpression new
		name: 'i' ;
		localDeclaration: nonLocalDeclaration ;
		yourself.

	infixExpr := FASTJavaInfixOperation new
		operator: '>' ;
		leftOperand: variableExpr ;
		rightOperand: (FASTJavaIntegerLiteral new
			primitiveValue: '0' ;
			yourself) ;
		yourself.

	assignementExpr := FASTJavaAssignementExpression new
		variable: variableExpr ;
		expression: infixExpr ;
		yourself.

	declarationStmt := FASTJavaVarDeclStatement new.
	returnStmt := FASTJavaReturnStatement new.

	ifStmt := FASTJavaIfStatement new
		condition: infixExpr ;
		localDeclaration: nonLocalDeclaration ;
		yourself.

	blockStmt := FASTJavaStatementBlock new
]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testBlockStatement [
	"{ declarationStmt ; otherStmt; returnStmt; }"
	| otherStmt flowGraph node |
	otherStmt := FASTJavaVarDeclStatement new.
	blockStmt statements: { declarationStmt . otherStmt . returnStmt }.

	flowGraph := FASTJavaFlowGraphBuilder on: blockStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphFirstInBlockNode.
	self assert: flowGraph statement equals: declarationStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 1.

	node := flowGraph successors anyOne.
	self assert: node class equals: FASTJavaFlowGraphNode.
	self assert: node statement equals: otherStmt.
	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node class equals: FASTJavaFlowGraphNode.
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors size equals: 1.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testBlockStatementWithIfThen [
	"{ IF ... THEN declarationStmt; returnStmt; }"
	| flowGraph node |
	ifStmt thenPart: declarationStmt.
	blockStmt statements: { ifStmt . returnStmt }.

	flowGraph := FASTJavaFlowGraphBuilder on: blockStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphIfNode.
	self assert: flowGraph statement equals: ifStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 2.

	node := flowGraph successors
		detect: [ :n | n statement = declarationStmt ]
		ifNone: [ self fail ].

	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors size equals: 2.
	self assert: (node predecessors includes: flowGraph).
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testBlockStatementWithIfThenBlock [
	"{ IF ... THEN { declarationStmt; } returnStmt; }"
	| flowGraph node |
	ifStmt thenPart: (FASTJavaStatementBlock new
		statements: { declarationStmt } ;
		yourself).
	blockStmt statements: { ifStmt . returnStmt }.

	flowGraph := FASTJavaFlowGraphBuilder on: blockStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphIfNode.
	self assert: flowGraph statement equals: ifStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 2.

	node := flowGraph successors
		detect: [ :n | n statement = declarationStmt ]
		ifNone: [ self fail ].

	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node statement equals: returnStmt.
	self assert: node predecessors size equals: 2.
	self assert: (node predecessors includes: flowGraph).
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testBlockStatementWithIfThenElse [
	"{ IF ... THEN declarationStmt; ELSE stmt; returnStmt; }"
	| flowGraph node |
	ifStmt
		thenPart: declarationStmt ;
		elsePart: FASTJavaVarDeclStatement new.
	blockStmt statements: { ifStmt . returnStmt }.

	flowGraph := FASTJavaFlowGraphBuilder on: blockStmt.

	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 2.

	flowGraph successors do: [ :n |
		self assertCollection: n predecessors hasSameElements: { flowGraph }.
		self assert: n successors size equals: 1
	].

	node := flowGraph successors anyOne successors anyOne.
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors size equals: 2.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testIfStatementDependenciesBlockThen [
	"IF ... THEN { declarationStmt ; returnStmt; }"
	| flowGraph node |
	blockStmt statements: { declarationStmt . returnStmt }.
	ifStmt thenPart: blockStmt.
	flowGraph := FASTJavaFlowGraphBuilder on: ifStmt.

	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 1.
	
	node := flowGraph successors anyOne.
	self assert: node class equals: FASTJavaFlowGraphFirstInBlockNode.
	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors size equals: 1.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testIfStatementDependenciesSingleThen [
	"IF ... THEN declarationStmt;"
	| flowGraph node |
	ifStmt thenPart: declarationStmt.
	flowGraph := FASTJavaFlowGraphBuilder on: ifStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphIfNode.
	self assert: flowGraph statement equals: ifStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 1.
	
	node := flowGraph successors anyOne.
	self assert: node statement equals: declarationStmt.
	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testIfStatementDependenciesSingleThenBlockElse [
	"IF ... THEN declarationStmt; ELSE { declarationStmt ; returnStmt; }"
	| flowGraph node |
	blockStmt statements: { declarationStmt . returnStmt }.
	ifStmt
		thenPart: FASTJavaVarDeclStatement new ;
		elsePart: blockStmt.

	flowGraph := FASTJavaFlowGraphBuilder on: ifStmt.

	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 2.

	node := flowGraph successors
		detect: [ :n | n class = FASTJavaFlowGraphFirstInBlockNode ]
		ifNone: [ self fail ].
	
	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node statement equals: declarationStmt.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors size equals: 1.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testIfStatementDependenciesSingleThenSingleElse [
	"IF ... THEN declarationStmt; ELSE returnStmt;"
	| flowGraph |
	ifStmt
		thenPart: declarationStmt ;
		elsePart: returnStmt.
	flowGraph := FASTJavaFlowGraphBuilder on: ifStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphIfNode.
	self assert: flowGraph statement equals: ifStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 2.

	flowGraph successors do: [ :node |
		self assertCollection: node predecessors hasSameElements: { flowGraph }.
		self assert: node successors isEmpty
	]

]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testSimpleStatement [
	| flowGraph |
	flowGraph := FASTJavaFlowGraphBuilder on: declarationStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphNode.
	self assert: flowGraph statement equals: declarationStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors isEmpty.
]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testVariableWroteInAssignement [
	
	| statement flowGraph |
	statement := FASTJavaExpressionStatement new
		expression: assignementExpr ;
		yourself.

	flowGraph := FASTJavaFlowGraphBuilder on: statement.

	self assert: flowGraph defVariable equals: nonLocalDeclaration.


]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testVariablesReadInAssignement [
	
	| statement flowGraph |
	statement := FASTJavaExpressionStatement new
		expression: assignementExpr ;
		yourself.

	flowGraph := FASTJavaFlowGraphBuilder on: statement.

	self assertCollection: flowGraph refVariables hasSameElements: { nonLocalDeclaration }.


]
