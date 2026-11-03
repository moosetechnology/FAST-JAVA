"
I represent a java new array node.
ex.

new String()[""10px"", ""Hello world""]

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
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `infixOperationLeftOperandOwner` | `FASTTExpression` | `leftOperand` | `FASTJavaInfixOperation` | The left operand (if possible)|
| `infixOperationRightOperandOwner` | `FASTTExpression` | `rightOperand` | `FASTJavaInfixOperation` | The right operand (if possible)|
| `javaArrayAccessOwner` | `FASTTExpression` | `expression` | `FASTJavaArrayAccess` | The javaArrayAccess owner (if possible)|
| `javaArrayArrayAccessOwner` | `FASTTExpression` | `array` | `FASTJavaArrayAccess` | The javaArrayArrayAccess owner (if possible)|
| `javaArrayInitializers` | `FASTTExpression` | `initializers` | `FASTJavaArrayInitializer` | The owner of the expression|
| `javaAssignmentExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaAssignmentExpression` | The javaAssignmentExpression owner (if possible)|
| `javaCastExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaCastExpression` | The javaCastExpression owner (if possible)|
| `javaDimensionExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaDimensionExpression` | The pair of brackets whose length I give|
| `javaForEachStatementOwner` | `FASTTExpression` | `list` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaRecordPatternOwner` | `FASTTExpression` | `patterns` | `FASTJavaRecordPattern` | The record pattern that matches me as one of its components|
| `javaStringAssertStatementOwner` | `FASTTExpression` | `message` | `FASTJavaAssertStatement` | The assertion which I describe|
| `javaSynchronizedStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaThrowStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaThrowStatement` | The javaThrowStatement owner (if possible)|
| `javaUnaryExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaUnaryExpression` | The javaUnaryExpression owner (if possible)|
| `javaVariableDeclaratorExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaVariableDeclarator` | The javaVariableDeclarator owner (if possible)|
| `parentConditional` | `FASTTExpression` | `condition` | `FASTTWithCondition` | Optional condition statement/expression where this expression is used|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `receiverOwner` | `FASTJavaTReceiver` | `receiver` | `FASTJavaTWithReceiver` | The owner of the receiver|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `switchConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaSwitchStatement` | I represent a condition for my owner|
| `switchExpressionConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaSwitchExpression` | The switch expression whose condition I am|
| `switchLabelGuardOwner` | `FASTTExpression` | `guard` | `FASTJavaSwitchLabel` | The switch label I guard|
| `switchLabelOwner` | `FASTTExpression` | `caseExpressions` | `FASTJavaSwitchLabel` | The switch label that owns me|
| `yieldStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaYieldStatement` | The yield statement that owns me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `brackets` | `FASTJavaNewArray` | `newArrayOwner` | `FASTJavaDimension` | The bracket pairs I write, in the order I write them, eg. the two of `new int[3][]`|
| `initializer` | `FASTJavaNewArray` | `javaNewArrayInitialOwner` | `FASTJavaArrayInitializer` | The initializer of the array|
| `type` | `FASTJavaNewArray` | `javaNewArrayTypeOwner` | `FASTJavaTypeExpression` | The type of my elements, eg. the `int` of `new int[3]`|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaNewArray',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTReceiver + FASTTExpression',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTTExpression classTrait',
	#instVars : [
		'#brackets => FMMany type: #FASTJavaDimension opposite: #newArrayOwner',
		'#initializer => FMOne type: #FASTJavaArrayInitializer opposite: #javaNewArrayInitialOwner',
		'#type => FMOne type: #FASTJavaTypeExpression opposite: #javaNewArrayTypeOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaNewArray class >> annotation [

	<ignoreForCoverage>
	<FMClass: #NewArray super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaNewArray >> addBracket: anObject [

	<ignoreForCoverage>
	<generated>
	^ self brackets add: anObject
]

{ #category : 'accessing' }
FASTJavaNewArray >> brackets [
	"Relation named: #brackets type: #FASTJavaDimension opposite: #newArrayOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The bracket pairs I write, in the order I write them, eg. the two of `new int[3][]`'>
	^ brackets
]

{ #category : 'accessing' }
FASTJavaNewArray >> brackets: anObject [

	<ignoreForCoverage>
	<generated>
	brackets value: anObject
]

{ #category : 'accessing' }
FASTJavaNewArray >> initializer [
	"Relation named: #initializer type: #FASTJavaArrayInitializer opposite: #javaNewArrayInitialOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The initializer of the array'>
	^ initializer
]

{ #category : 'accessing' }
FASTJavaNewArray >> initializer: anObject [

	<ignoreForCoverage>
	<generated>
	initializer := anObject
]

{ #category : 'testing' }
FASTJavaNewArray >> isNewArray [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaNewArray >> type [
	"Relation named: #type type: #FASTJavaTypeExpression opposite: #javaNewArrayTypeOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The type of my elements, eg. the `int` of `new int[3]`'>
	^ type
]

{ #category : 'accessing' }
FASTJavaNewArray >> type: anObject [

	<ignoreForCoverage>
	<generated>
	type := anObject
]
