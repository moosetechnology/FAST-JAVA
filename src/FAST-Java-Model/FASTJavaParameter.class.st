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
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `infixOperationLeftOperandOwner` | `FASTTExpression` | `leftOperand` | `FASTJavaInfixOperation` | The left operand (if possible)|
| `infixOperationRightOperandOwner` | `FASTTExpression` | `rightOperand` | `FASTJavaInfixOperation` | The right operand (if possible)|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `javaArrayAccessOwner` | `FASTTExpression` | `expression` | `FASTJavaArrayAccess` | The javaArrayAccess owner (if possible)|
| `javaArrayArrayAccessOwner` | `FASTTExpression` | `array` | `FASTJavaArrayAccess` | The javaArrayArrayAccess owner (if possible)|
| `javaArrayInitializers` | `FASTTExpression` | `initializers` | `FASTJavaArrayInitializer` | The owner of the expression|
| `javaAssignmentExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaAssignmentExpression` | The javaAssignmentExpression owner (if possible)|
| `javaCastExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaCastExpression` | The javaCastExpression owner (if possible)|
| `javaDimensionExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaDimensionExpression` | The pair of brackets whose length I give|
| `javaForEachStatementOwner` | `FASTTExpression` | `list` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaNewArrayInitialOwner` | `FASTTExpression` | `initializer` | `FASTJavaNewArray` | I belong to a new array initialization|
| `javaOuterThisOwner` | `FASTTExpression` | `type` | `FASTJavaOuterThis` | The javaOuterThis owner (if possible)|
| `javaRecordPatternOwner` | `FASTTExpression` | `patterns` | `FASTJavaRecordPattern` | The record pattern that matches me as one of its components|
| `javaStringAssertStatementOwner` | `FASTTExpression` | `message` | `FASTJavaAssertStatement` | The assertion which I describe|
| `javaSynchronizedStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaThrowStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaThrowStatement` | The javaThrowStatement owner (if possible)|
| `javaUnaryExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaUnaryExpression` | The javaUnaryExpression owner (if possible)|
| `javaVariableDeclaratorExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaVariableDeclarator` | The javaVariableDeclarator owner (if possible)|
| `parameterOwner` | `FASTTVariableEntity` | `parameters` | `FASTTWithParameters` | parameterOwner|
| `parentAssignmentExpression` | `FASTTVariableEntity` | `variable` | `FASTTAssignment` | Optional assignment to the variable|
| `parentConditional` | `FASTTExpression` | `condition` | `FASTTWithCondition` | Optional condition statement/expression where this expression is used|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `recordOwner` | `FASTJavaParameter` | `components` | `FASTJavaRecordDeclaration` | The record that declares me as one of its components|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `switchConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaSwitchStatement` | I represent a condition for my owner|
| `switchExpressionConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaSwitchExpression` | The switch expression whose condition I am|
| `switchLabelGuardOwner` | `FASTTExpression` | `guard` | `FASTJavaSwitchLabel` | The switch label I guard|
| `switchLabelOwner` | `FASTTExpression` | `caseExpressions` | `FASTJavaSwitchLabel` | The switch label that owns me|
| `yieldStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaYieldStatement` | The yield statement that owns me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotations` | `FASTJavaTWithAnnotations` | `javaAnnotationOwner` | `FASTJavaAnnotation` | The annotations written on me|
| `brackets` | `FASTJavaParameter` | `parameterOwner` | `FASTJavaDimension` | The bracket pairs written after my name, eg. the one of `char cbuf[]`|
| `ellipsis` | `FASTJavaParameter` | `ellipsisOwner` | `FASTJavaDimension` | The ellipsis I write before my name, and the annotations written on it|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaModifier` | The keywords I write|
| `type` | `FASTJavaParameter` | `javaParameterTypeOwner` | `FASTJavaTypeExpression` | The type of the parameter|
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
	#name : 'FASTJavaParameter',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTWithAnnotations + FASTJavaTWithModifiers + FASTTExpression + FASTTVariableEntity',
	#classTraits : 'FASTJavaTWithAnnotations classTrait + FASTJavaTWithModifiers classTrait + FASTTExpression classTrait + FASTTVariableEntity classTrait',
	#instVars : [
		'#brackets => FMMany type: #FASTJavaDimension opposite: #parameterOwner',
		'#ellipsis => FMOne type: #FASTJavaDimension opposite: #ellipsisOwner',
		'#recordOwner => FMOne type: #FASTJavaRecordDeclaration opposite: #components',
		'#type => FMOne type: #FASTJavaTypeExpression opposite: #javaParameterTypeOwner',
		'#variable => FMOne type: #FASTJavaVariableExpression opposite: #javaParameterVariableOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaParameter class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Parameter super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaParameter >> addBracket: anObject [

	<ignoreForCoverage>
	<generated>
	^ self brackets add: anObject
]

{ #category : 'accessing' }
FASTJavaParameter >> brackets [
	"Relation named: #brackets type: #FASTJavaDimension opposite: #parameterOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The bracket pairs written after my name, eg. the one of `char cbuf[]`'>
	^ brackets
]

{ #category : 'accessing' }
FASTJavaParameter >> brackets: anObject [

	<ignoreForCoverage>
	<generated>
	brackets value: anObject
]

{ #category : 'accessing' }
FASTJavaParameter >> ellipsis [
	"Relation named: #ellipsis type: #FASTJavaDimension opposite: #ellipsisOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The ellipsis I write before my name, and the annotations written on it'>
	^ ellipsis
]

{ #category : 'accessing' }
FASTJavaParameter >> ellipsis: anObject [

	<ignoreForCoverage>
	<generated>
	ellipsis := anObject
]

{ #category : 'testing' }
FASTJavaParameter >> isParameter [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaParameter >> recordOwner [
	"Relation named: #recordOwner type: #FASTJavaRecordDeclaration opposite: #components"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The record that declares me as one of its components'>
	<container>
	^ recordOwner
]

{ #category : 'accessing' }
FASTJavaParameter >> recordOwner: anObject [

	<ignoreForCoverage>
	<generated>
	recordOwner := anObject
]

{ #category : 'accessing' }
FASTJavaParameter >> type [
	"Relation named: #type type: #FASTJavaTypeExpression opposite: #javaParameterTypeOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The type of the parameter'>
	^ type
]

{ #category : 'accessing' }
FASTJavaParameter >> type: anObject [

	<ignoreForCoverage>
	<generated>
	type := anObject
]

{ #category : 'accessing' }
FASTJavaParameter >> variable [
	"Relation named: #variable type: #FASTJavaVariableExpression opposite: #javaParameterVariableOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'parameter variable'>
	^ variable
]

{ #category : 'accessing' }
FASTJavaParameter >> variable: anObject [

	<ignoreForCoverage>
	<generated>
	variable := anObject
]
