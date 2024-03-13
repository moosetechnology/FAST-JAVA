"
I represent a parameter of a method declaration

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
| `javaNewArrayInitialOwner` | `FASTTExpression` | `initializer` | `FASTJavaNewArray` | I belong to a new array initialization|
| `javaStringAssertStatementOwner` | `FASTTExpression` | `message` | `FASTJavaAssertStatement` | The assertion which I describe|
| `javaSynchronizedStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaThrowStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaThrowStatement` | The javaThrowStatement owner (if possible)|
| `javaVariableDeclaratorExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaVariableDeclarator` | The javaVariableDeclarator owner (if possible)|
| `parameterOwner` | `FASTTVariableEntity` | `parameters` | `FASTTWithParameters` | parameterOwner|
| `parentAssignmentExpression` | `FASTTVariableEntity` | `variable` | `FASTTAssignment` | Optional assignment to the variable|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `switchConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaSwitchStatement` | I represent a condition for my owner|
| `whileConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaWhileStatement` | I represent a condition for my owner|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `type` | `FASTJavaParameter` | `javaParameterTypeOwner` | `FASTJavaVariableExpression` | The type of the parameter|
| `variable` | `FASTJavaParameter` | `javaParameterVariableOwner` | `FASTJavaVariableExpression` | parameter variable|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaParameter,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTExpression + FASTTVariableEntity',
	#classTraits : 'FASTTExpression classTrait + FASTTVariableEntity classTrait',
	#instVars : [
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaParameterTypeOwner',
		'#variable => FMOne type: #FASTJavaVariableExpression opposite: #javaParameterVariableOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaParameter class >> annotation [

	<FMClass: #Parameter super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaParameter >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaParameterTypeOwner"

	<generated>
	<FMComment: 'The type of the parameter'>
	^ type
]

{ #category : #accessing }
FASTJavaParameter >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #navigation }
FASTJavaParameter >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]

{ #category : #accessing }
FASTJavaParameter >> variable [
	"Relation named: #variable type: #FASTJavaVariableExpression opposite: #javaParameterVariableOwner"

	<generated>
	<FMComment: 'parameter variable'>
	^ variable
]

{ #category : #accessing }
FASTJavaParameter >> variable: anObject [

	<generated>
	variable := anObject
]

{ #category : #navigation }
FASTJavaParameter >> variableGroup [
	<generated>
	<navigation: 'Variable'>
	^ MooseSpecializedGroup with: self variable
]
