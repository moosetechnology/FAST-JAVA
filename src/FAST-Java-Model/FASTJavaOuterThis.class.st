"
I represent a java outer this (only a call to 'this' to a class)
	
ex.:

hello(MyClass.this)

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
| `type` | `FASTJavaOuterThis` | `javaOuterThisOwner` | `FASTJavaVariableExpression` | The accessed type|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaOuterThis,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTReceiver + FASTTExpression',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTTExpression classTrait',
	#instVars : [
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaOuterThisOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaOuterThis class >> annotation [

	<FMClass: #OuterThis super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaOuterThis >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaOuterThisOwner"

	<generated>
	<FMComment: 'The accessed type'>
	^ type
]

{ #category : #accessing }
FASTJavaOuterThis >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #navigation }
FASTJavaOuterThis >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
