"
I represent JavaTypeParameter such as `void <T extends Hello> T myMethod()`

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
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `javaArrayAccessOwner` | `FASTTExpression` | `expression` | `FASTJavaArrayAccess` | The javaArrayAccess owner (if possible)|
| `javaArrayArrayAccessOwner` | `FASTTExpression` | `array` | `FASTJavaArrayAccess` | The javaArrayArrayAccess owner (if possible)|
| `javaArrayInitializers` | `FASTTExpression` | `initializers` | `FASTJavaArrayInitializer` | The owner of the expression|
| `javaArrayTypeNameOwner` | `FASTTExpression` | `baseType` | `FASTJavaArrayTypeExpression` | The variable expression owner (if possible)|
| `javaAssignmentExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaAssignmentExpression` | The javaAssignmentExpression owner (if possible)|
| `javaCastExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaCastExpression` | The javaCastExpression owner (if possible)|
| `javaForEachStatementOwner` | `FASTTExpression` | `list` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaLabeledCaseStatementOwner` | `FASTTExpression` | `label` | `FASTJavaLabeledCaseStatement` | The javaLabeledCaseStatement owner (if possible)|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `javaMethodTypeParameterOwner` | `FASTJavaTypeParameterExpression` | `typeParameters` | `FASTJavaMethodEntity` | The method that use me|
| `javaNewArrayInitialOwner` | `FASTTExpression` | `initializer` | `FASTJavaNewArray` | I belong to a new array initialization|
| `javaStringAssertStatementOwner` | `FASTTExpression` | `message` | `FASTJavaAssertStatement` | The assertion which I describe|
| `javaSynchronizedStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaThrowStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaThrowStatement` | The javaThrowStatement owner (if possible)|
| `javaUnaryExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaUnaryExpression` | The javaUnaryExpression owner (if possible)|
| `javaVariableDeclaratorExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaVariableDeclarator` | The javaVariableDeclarator owner (if possible)|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `switchConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaSwitchStatement` | I represent a condition for my owner|
| `whileConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaWhileStatement` | I represent a condition for my owner|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `types` | `FASTJavaTypeParameterExpression` | `typeParameterOwner` | `FASTJavaClassTypeExpression` | The list of types I extend or implements|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaTypeParameterExpression,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTExpression + FASTTNamedEntity',
	#classTraits : 'FASTTExpression classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#javaMethodTypeParameterOwner => FMOne type: #FASTJavaMethodEntity opposite: #typeParameters',
		'#types => FMMany type: #FASTJavaClassTypeExpression opposite: #typeParameterOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaTypeParameterExpression class >> annotation [

	<FMClass: #TypeParameterExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTJavaTypeParameterExpression >> addType: anObject [
	<generated>
	^ self types add: anObject
]

{ #category : #accessing }
FASTJavaTypeParameterExpression >> javaMethodTypeParameterOwner [
	"Relation named: #javaMethodTypeParameterOwner type: #FASTJavaMethodEntity opposite: #typeParameters"

	<generated>
	<FMComment: 'The method that use me'>
	<container>
	^ javaMethodTypeParameterOwner
]

{ #category : #accessing }
FASTJavaTypeParameterExpression >> javaMethodTypeParameterOwner: anObject [

	<generated>
	javaMethodTypeParameterOwner := anObject
]

{ #category : #navigation }
FASTJavaTypeParameterExpression >> javaMethodTypeParameterOwnerGroup [
	<generated>
	<navigation: 'JavaMethodTypeParameterOwner'>
	^ MooseSpecializedGroup with: self javaMethodTypeParameterOwner
]

{ #category : #accessing }
FASTJavaTypeParameterExpression >> types [
	"Relation named: #types type: #FASTJavaClassTypeExpression opposite: #typeParameterOwner"

	<generated>
	<FMComment: 'The list of types I extend or implements'>
	<derived>
	^ types
]

{ #category : #accessing }
FASTJavaTypeParameterExpression >> types: anObject [

	<generated>
	types value: anObject
]

{ #category : #navigation }
FASTJavaTypeParameterExpression >> typesGroup [
	<generated>
	<navigation: 'Types'>
	^ MooseSpecializedGroup withAll: self types asSet
]
