Class {
	#name : #FASTJavaTestNodeBuilder,
	#superclass : #TestCase,
	#category : #'FAST-Java-Tools-Tests'
}

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> assignment: aName value: aNode [
	^FASTJavaAssignmentExpression new
		variable: (self var: aName) ;
		expression: aNode ;
		yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> block: aNodeCollection [
	| node i |
	node := FASTJavaStatementBlock new.
	
	i := 1.
	aNodeCollection do: [ :aStmtNode |
		aStmtNode startPos: i.
		node addStatement: aStmtNode.
		i := i + 1 ].
	^node
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> cast: aName expression: aNode [
	^FASTJavaCastExpression new
		type: (FASTJavaClassTypeExpression new typeName: (self type: aName)) ;
		expression: aNode ;
		yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> conditionalExpr: anExpr then: aThenPart else: anElsePart [

	^ FASTJavaConditionalExpression new
		  condition: anExpr;
		  thenPart: aThenPart;
		  elsePart: anElsePart;
		  yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> declarator: aName init: aNode [
	^FASTJavaVariableDeclarator new
		variable: (self var: aName) ;
		expression: aNode ;
		yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> exprStatement: aNode [
	^FASTJavaExpressionStatement new
		expression: aNode ;
		yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> if: conditionNode then: thenNode else: elseNode [
	^FASTJavaIfStatement new
		condition: conditionNode ;
		thenPart: thenNode ;
		elsePart: elseNode ;
		yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> infix: aString lhs: aNode1 rhs: aNode2 [
	^FASTJavaInfixOperation new
		operator: aString ;
		leftOperand: aNode1 ;
		rightOperand: aNode2 ;
		yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> invocation: aName recvr: recvrNode args: aNodeCollection [
	| node |
	node := FASTJavaMethodInvocation new
		name: aName ;
		receiver: recvrNode ;
		yourself.
	aNodeCollection collect: [ :argNode |
		node addArgument: argNode
	].
	^node
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> literalInt: aValue [
	^FASTJavaIntegerLiteral new
		primitiveValue: aValue asString ;
		yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> literalNull [
	^FASTJavaNullLiteral new
		primitiveValue: 'null' ;
		yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> literalString: aValue [
	^FASTJavaStringLiteral new
		primitiveValue: aValue ;
		yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> return: aNode [
	^FASTJavaReturnStatement new
		expression: aNode ;
		yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> type: aName [
	^FASTJavaTypeName new
		name: aName ;
		yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> unaryOp: anOperator prefix: aBoolean expr: anExpr [

	^ FASTJavaUnaryExpression new
		  operator: anOperator;
		  isPrefixedUnaryExpression: aBoolean;
		  expression: anExpr;
		  yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> var: aName [
	^FASTJavaVariableExpression new
		name: aName ;
		yourself
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> var: aVarName declaration: aTypeName [
	^self varDeclarations: aTypeName declarators: { self declarator: aVarName init: nil }
		
]

{ #category : #'as yet unclassified' }
FASTJavaTestNodeBuilder >> varDeclarations: aTypeName declarators: aNodeCollection [
	| node |
	node := FASTJavaVarDeclStatement new
		type: (FASTJavaClassTypeExpression new typeName: aTypeName ; yourself) ;
		yourself.
	aNodeCollection do: [ :aDeclaratorNode | node addDeclarator: aDeclaratorNode ].
	^node
		
]
