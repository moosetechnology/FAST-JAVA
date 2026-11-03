Class {
	#name : 'FASTJavaTestNodeBuilder',
	#superclass : 'TestCase',
	#category : 'FAST-Java-Tools-Tests-utils',
	#package : 'FAST-Java-Tools-Tests',
	#tag : 'utils'
}

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> annotation: aString [
	^FASTJavaAnnotation new
		name: aString ;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> array: aName accessAtFirstDimensionIndex: firstInt andSecondDimensionIndex: secondInt [  

	^ FASTJavaArrayAccess new
		  array: (self array: aName accessAtIndex: firstInt); 
		  expression: (self literalInt: secondInt);
		  yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> array: aName accessAtIndex: anInt [

	^ FASTJavaArrayAccess new
		  array: (self var: aName);
		  expression: (self literalInt: anInt);
		  yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> arrayInitializer: aCollection [

	^FASTJavaArrayInitializer new
		initializers: aCollection ;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> assignment: aName value: aNode [
	^FASTJavaAssignmentExpression new
		operator: '=' ;
		variable: (self var: aName) ;
		expression: aNode ;
		yourself
]

{ #category : 'api - building' }
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

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> cast: aName expression: aNode [
	^FASTJavaCastExpression new
		type: (FASTJavaClassTypeExpression new typeName: (self type: aName)) ;
		expression: aNode ;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> class: aName [
	^FASTJavaClassDeclaration new
		name: aName ;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> comment: aString [
	^FASTJavaComment new
		content: aString ;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> conditionalExpr: anExpr then: aThenPart else: anElsePart [

	^ FASTJavaConditionalExpression new
		  condition: anExpr;
		  thenPart: aThenPart;
		  elsePart: anElsePart;
		  yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> declaration: declarators type: aType modifiers: modifiers [
	^FASTJavaVarDeclStatement new
		modifiers: modifiers ;
		type: aType ;
		declarators: declarators ;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> declarator: aName init: aNode [
	^FASTJavaVariableDeclarator new
		variable: (self var: aName) ;
		expression: aNode ;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> dimensionOfLength: anExpression [
	"JLS 15.10.1: a pair of brackets saying how long the dimension it opens is."

	^ FASTJavaDimensionExpression new
		  expression: anExpression;
		  yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> doubleArrayType [
	^ FASTJavaArrayTypeExpression new
		  baseType: FASTJavaDoubleTypeExpression new;
		  yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> emptyDimension [
	"JLS 15.10.1: a pair of brackets an array creation leaves empty."

	^ FASTJavaDimension new
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> exprStatement: aNode [
	^FASTJavaExpressionStatement new
		expression: aNode ;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> if: conditionNode then: thenNode else: elseNode [
	^FASTJavaIfStatement new
		condition: conditionNode ;
		thenPart: thenNode ;
		elsePart: elseNode ;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> infix: aString lhs: aNode1 rhs: aNode2 [
	^FASTJavaInfixOperation new
		operator: aString ;
		leftOperand: aNode1 ;
		rightOperand: aNode2 ;
		yourself
]

{ #category : 'api - building' }
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

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> literal: aClass value: aString [ 
	^aClass new primitiveValue: aString ; yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> literalFloat: aValue [
	^self literal: FASTJavaFloatLiteral value: aValue asString
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> literalInt: aValue [
	^self literal: FASTJavaIntegerLiteral value: aValue asString
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> literalNull [
	^self literal: FASTJavaNullLiteral value: 'null'
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> literalString: aValue [
	^self literal: FASTJavaStringLiteral value: aValue
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> modifier: aName [
	^FASTJavaModifier new
		token: aName ;
		yourself
]

{ #category : 'instance creation' }
FASTJavaTestNodeBuilder >> newExpression: className args: args [

	^FASTJavaNewExpression new
		type: (FASTJavaClassTypeExpression new typeName: (self type: className));
		arguments: args;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> newStringArrayExpression: brackets [

	^FASTJavaNewArray new
		type: (FASTJavaClassTypeExpression new typeName: (self type: 'String'));
		brackets: brackets;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> return: aNode [
	^FASTJavaReturnStatement new
		expression: aNode ;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> stringArrayType [

	^ FASTJavaArrayTypeExpression new
		  baseType: (FASTJavaTypeName new name: 'String');
		  yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> stringTwoDimensionalArrayType [

	^ FASTJavaArrayTypeExpression new
		  baseType: self stringArrayType;
		  yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> type: aName [
	^FASTJavaTypeName new
		name: aName ;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> unaryOp: anOperator prefix: aBoolean expr: anExpr [

	^ FASTJavaUnaryExpression new
		  operator: anOperator;
		  isPrefixedUnaryExpression: aBoolean;
		  expression: anExpr;
		  yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> var: aName [
	^FASTJavaVariableExpression new
		name: aName ;
		yourself
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> var: aVarName declaration: aTypeName [
	^self
		varDeclarations: ((FASTJavaClassTypeExpression new typeName: (self type: aTypeName)))
		declarators: { self declarator: aVarName init: nil }
		
]

{ #category : 'api - building' }
FASTJavaTestNodeBuilder >> varDeclarations: aType declarators: aNodeCollection [
	^self
		declaration: aNodeCollection
		type: aType
		modifiers: #()

]
