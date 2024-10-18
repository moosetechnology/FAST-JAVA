"
Binary java operations in  format: <expr> <operator> <expr>

ex:
	a + b
	3 == 6
	a = 6

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assertConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaAssertStatement` | I represent a condition for my owner|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `conditionalConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaConditionalExpression` | I represent a condition for my owner|
| `conditionalElsePartOwner` | `FASTTExpression` | `elsePart` | `FASTJavaConditionalExpression` | The if owner (if possible)|
| `conditionalThenPartOwner` | `FASTTExpression` | `thenPart` | `FASTJavaConditionalExpression` | The if owner (if possible)|
| `doConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaDoWhileStatement` | I represent a condition for my owner|
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `forConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaForStatement` | I represent a condition for my owner|
| `ifConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaIfStatement` | I represent a condition for my owner|
| `infixOperationLeftOperandOwner` | `FASTTExpression` | `leftOperand` | `FASTJavaInfixOperation` | The left operand (if possible)|
| `infixOperationRightOperandOwner` | `FASTTExpression` | `rightOperand` | `FASTJavaInfixOperation` | The right operand (if possible)|
| `javaArrayAccessOwner` | `FASTTExpression` | `expression` | `FASTJavaArrayAccess` | The javaArrayAccess owner (if possible)|
| `javaArrayArrayAccessOwner` | `FASTTExpression` | `array` | `FASTJavaArrayAccess` | The javaArrayArrayAccess owner (if possible)|
| `javaArrayInitializers` | `FASTTExpression` | `initializers` | `FASTJavaArrayInitializer` | The owner of the expression|
| `javaArrayTypeNameOwner` | `FASTTExpression` | `baseType` | `FASTJavaArrayTypeExpression` | The variable expression owner (if possible)|
| `javaAssignmentExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaAssignmentExpression` | The javaAssignmentExpression owner (if possible)|
| `javaCastExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaCastExpression` | The javaCastExpression owner (if possible)|
| `javaForEachStatementOwner` | `FASTTExpression` | `list` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaLabeledCaseStatementOwner` | `FASTTExpression` | `label` | `FASTJavaLabeledCaseStatement` | The javaLabeledCaseStatement owner (if possible)|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `javaNewArrayInitialOwner` | `FASTTExpression` | `initializer` | `FASTJavaNewArray` | I belong to a new array initialization|
| `javaStringAssertStatementOwner` | `FASTTExpression` | `message` | `FASTJavaAssertStatement` | The assertion which I describe|
| `javaSynchronizedStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaThrowStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaThrowStatement` | The javaThrowStatement owner (if possible)|
| `javaUnaryExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaUnaryExpression` | The javaUnaryExpression owner (if possible)|
| `javaVariableDeclaratorExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaVariableDeclarator` | The javaVariableDeclarator owner (if possible)|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `receiverOwner` | `FASTJavaTReceiver` | `receiver` | `FASTJavaTWithReceiver` | The owner of the receiver|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `switchConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaSwitchStatement` | I represent a condition for my owner|
| `whileConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaWhileStatement` | I represent a condition for my owner|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `leftOperand` | `FASTJavaInfixOperation` | `infixOperationLeftOperandOwner` | `FASTTExpression` | leftOperand|
| `rightOperand` | `FASTJavaInfixOperation` | `infixOperationRightOperandOwner` | `FASTTExpression` | rightOperand|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `operator` | `String` | nil | operator s symbol|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaInfixOperation',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTReceiver + FASTTExpression',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTTExpression classTrait',
	#instVars : [
		'#operator => FMProperty'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaInfixOperation class >> annotation [

	<FMClass: #InfixOperation super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaInfixOperation >> leftOperand [
	"Relation named: #leftOperand type: #FASTTExpression opposite: #infixOperationLeftOperandOwner"

	<generated>
	<FMComment: 'leftOperand'>
	<FMProperty: #leftOperand type: #FASTTExpression opposite: #infixOperationLeftOperandOwner>
	^ self attributeAt: #leftOperand ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaInfixOperation >> leftOperand: anObject [

	<generated>
	(self attributeAt: #leftOperand ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self leftOperand.
		self attributeAt: #leftOperand put: anObject.
		otherSide infixOperationLeftOperandOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #leftOperand put: anObject.
		anObject infixOperationLeftOperandOwner: self ]
]

{ #category : 'navigation' }
FASTJavaInfixOperation >> leftOperandGroup [
	<generated>
	<navigation: 'LeftOperand'>
	^ MooseSpecializedGroup with: self leftOperand
]

{ #category : 'accessing' }
FASTJavaInfixOperation >> operator [

	<FMProperty: #operator type: #String>
	<generated>
	<FMComment: 'operator s symbol'>
	^ operator
]

{ #category : 'accessing' }
FASTJavaInfixOperation >> operator: anObject [
	<generated>
	operator := anObject
]

{ #category : 'accessing' }
FASTJavaInfixOperation >> rightOperand [
	"Relation named: #rightOperand type: #FASTTExpression opposite: #infixOperationRightOperandOwner"

	<generated>
	<FMComment: 'rightOperand'>
	<FMProperty: #rightOperand type: #FASTTExpression opposite: #infixOperationRightOperandOwner>
	^ self attributeAt: #rightOperand ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaInfixOperation >> rightOperand: anObject [

	<generated>
	(self attributeAt: #rightOperand ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self rightOperand.
		self attributeAt: #rightOperand put: anObject.
		otherSide infixOperationRightOperandOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #rightOperand put: anObject.
		anObject infixOperationRightOperandOwner: self ]
]

{ #category : 'navigation' }
FASTJavaInfixOperation >> rightOperandGroup [
	<generated>
	<navigation: 'RightOperand'>
	^ MooseSpecializedGroup with: self rightOperand
]
