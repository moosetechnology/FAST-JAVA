"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `arrayOwner` | `FASTJavaTAnnotationElement` | `values` | `FASTJavaArrayAnnotationElement` | The ArrayAnnotationElement I am an element of|
| `assertConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaAssertStatement` | I represent a condition for my owner|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `conditionalConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaConditionalExpression` | I represent a condition for my owner|
| `conditionalElsePartOwner` | `FASTTExpression` | `elsePart` | `FASTJavaConditionalExpression` | The if owner (if possible)|
| `conditionalThenPartOwner` | `FASTTExpression` | `thenPart` | `FASTJavaConditionalExpression` | The if owner (if possible)|
| `defaultValueOwner` | `FASTJavaTAnnotationElement` | `defaultValue` | `FASTJavaAnnotationElementDeclaration` | The annotation element declaration I am the default value of|
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `infixOperationLeftOperandOwner` | `FASTTExpression` | `leftOperand` | `FASTJavaInfixOperation` | The left operand (if possible)|
| `infixOperationRightOperandOwner` | `FASTTExpression` | `rightOperand` | `FASTJavaInfixOperation` | The right operand (if possible)|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `javaArrayAccessOwner` | `FASTTExpression` | `expression` | `FASTJavaArrayAccess` | The javaArrayAccess owner (if possible)|
| `javaArrayArrayAccessOwner` | `FASTTExpression` | `array` | `FASTJavaArrayAccess` | The javaArrayArrayAccess owner (if possible)|
| `javaArrayInitializers` | `FASTTExpression` | `initializers` | `FASTJavaArrayInitializer` | The owner of the expression|
| `javaAssignmentExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaAssignmentExpression` | The javaAssignmentExpression owner (if possible)|
| `javaCastExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaCastExpression` | The javaCastExpression owner (if possible)|
| `javaCatchParameterOwner` | `FASTJavaVariableExpression` | `parameter` | `FASTJavaCatchPartStatement` | The javaCatchPartParameterOwner owner (if possible)|
| `javaDimensionExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaDimensionExpression` | The pair of brackets whose length I give|
| `javaForEachStatementOwner` | `FASTTExpression` | `list` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaNewArrayInitialOwner` | `FASTTExpression` | `initializer` | `FASTJavaNewArray` | I belong to a new array initialization|
| `javaParameterVariableOwner` | `FASTJavaVariableExpression` | `variable` | `FASTJavaParameter` | The variable expression owner (if possible)|
| `javaRecordPatternOwner` | `FASTTExpression` | `patterns` | `FASTJavaRecordPattern` | The record pattern that matches me as one of its components|
| `javaStringAssertStatementOwner` | `FASTTExpression` | `message` | `FASTJavaAssertStatement` | The assertion which I describe|
| `javaSynchronizedStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaThrowStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaThrowStatement` | The javaThrowStatement owner (if possible)|
| `javaTryResourceOwner` | `FASTJavaTTryResource` | `resources` | `FASTJavaTryCatchStatement` | The try-with-resource that owns me|
| `javaTypePatternVariableOwner` | `FASTJavaVariableExpression` | `variable` | `FASTJavaTypePattern` | The javaTypePattern variable owner (if possible)|
| `javaUnaryExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaUnaryExpression` | The javaUnaryExpression owner (if possible)|
| `javaVariableAssignmentOwner` | `FASTJavaTAssignable` | `variable` | `FASTJavaTWithAssignable` | The owner of the assignment|
| `javaVariableDeclaratorExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaVariableDeclarator` | The javaVariableDeclarator owner (if possible)|
| `javaVariableDeclaratorOwner` | `FASTJavaVariableExpression` | `variable` | `FASTJavaVariableDeclarator` | The javaVariableDeclarator owner (if possible)|
| `parentAnnotation` | `FASTJavaTAnnotationElement` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, eg. ""unchecked"" in the following annotation: 	@SuppressWarnings(value=""unchecked"")|
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


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaVariableExpression',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTAnnotationElement + FASTJavaTAssignable + FASTJavaTReceiver + FASTJavaTTryResource + FASTTVariableExpression',
	#classTraits : 'FASTJavaTAnnotationElement classTrait + FASTJavaTAssignable classTrait + FASTJavaTReceiver classTrait + FASTJavaTTryResource classTrait + FASTTVariableExpression classTrait',
	#instVars : [
		'#javaCatchParameterOwner => FMOne type: #FASTJavaCatchPartStatement opposite: #parameter',
		'#javaParameterVariableOwner => FMOne type: #FASTJavaParameter opposite: #variable',
		'#javaTypePatternVariableOwner => FMOne type: #FASTJavaTypePattern opposite: #variable',
		'#javaVariableDeclaratorOwner => FMOne type: #FASTJavaVariableDeclarator opposite: #variable'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaVariableExpression class >> annotation [

	<ignoreForCoverage>
	<FMClass: #VariableExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaCatchParameterOwner [
	"Relation named: #javaCatchParameterOwner type: #FASTJavaCatchPartStatement opposite: #parameter"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaCatchPartParameterOwner owner (if possible)'>
	<container>
	^ javaCatchParameterOwner
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaCatchParameterOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaCatchParameterOwner := anObject
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaParameterVariableOwner [
	"Relation named: #javaParameterVariableOwner type: #FASTJavaParameter opposite: #variable"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	^ javaParameterVariableOwner
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaParameterVariableOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaParameterVariableOwner := anObject
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaTypePatternVariableOwner [
	"Relation named: #javaTypePatternVariableOwner type: #FASTJavaTypePattern opposite: #variable"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaTypePattern variable owner (if possible)'>
	<container>
	<derived>
	^ javaTypePatternVariableOwner
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaTypePatternVariableOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaTypePatternVariableOwner := anObject
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaVariableDeclaratorOwner [
	"Relation named: #javaVariableDeclaratorOwner type: #FASTJavaVariableDeclarator opposite: #variable"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaVariableDeclarator owner (if possible)'>
	<container>
	<derived>
	^ javaVariableDeclaratorOwner
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaVariableDeclaratorOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaVariableDeclaratorOwner := anObject
]
