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
| `javaArrayTypeNameOwner` | `FASTTExpression` | `baseType` | `FASTJavaArrayTypeExpression` | The variable expression owner (if possible)|
| `javaAssignmentExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaAssignmentExpression` | The javaAssignmentExpression owner (if possible)|
| `javaCastExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaCastExpression` | The javaCastExpression owner (if possible)|
| `javaCastExpressionTypeOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaCastExpression` | The javaCastExpression owner (if possible)|
| `javaCatchParameterOwnler` | `FASTJavaVariableExpression` | `parameter` | `FASTJavaCatchPartStatement` | The javaCatchPartParameterOwner owner (if possible)|
| `javaClassPropertyOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaClassProperty` | The javaClassProperty owner (if possible)|
| `javaForEachStatementOwner` | `FASTTExpression` | `list` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaMethodTypeOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaMethodEntity` | The variable expression owner (if possible)|
| `javaNewArrayInitialOwner` | `FASTTExpression` | `initializer` | `FASTJavaNewArray` | I belong to a new array initialization|
| `javaNewExpressionOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaNewExpression` | The javaNewExpression owner (if possible)|
| `javaOuterThisOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaOuterThis` | The javaOuterThis owner (if possible)|
| `javaParameterTypeOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaParameter` | The variable expression owner (if possible)|
| `javaParameterVariableOwner` | `FASTJavaVariableExpression` | `variable` | `FASTJavaParameter` | The variable expression owner (if possible)|
| `javaStringAssertStatementOwner` | `FASTTExpression` | `message` | `FASTJavaAssertStatement` | The assertion which I describe|
| `javaSynchronizedStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaThrowStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaThrowStatement` | The javaThrowStatement owner (if possible)|
| `javaTryResourceOwner` | `FASTJavaTTryResource` | `resources` | `FASTJavaTryCatchStatement` | The try-with-resource that owns me|
| `javaTypePatternVariableOwner` | `FASTJavaVariableExpression` | `variable` | `FASTJavaTypePattern` | The javaTypePattern variable owner (if possible)|
| `javaUnaryExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaUnaryExpression` | The javaUnaryExpression owner (if possible)|
| `javaVarDeclTypeOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaVarDeclStatement` | The variable expression owner (if possible)|
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
		'#javaCastExpressionTypeOwner => FMOne type: #FASTJavaCastExpression opposite: #type',
		'#javaCatchParameterOwnler => FMOne type: #FASTJavaCatchPartStatement opposite: #parameter',
		'#javaClassPropertyOwner => FMOne type: #FASTJavaClassProperty opposite: #type',
		'#javaMethodTypeOwner => FMOne type: #FASTJavaMethodEntity opposite: #type',
		'#javaNewExpressionOwner => FMOne type: #FASTJavaNewExpression opposite: #type',
		'#javaOuterThisOwner => FMOne type: #FASTJavaOuterThis opposite: #type',
		'#javaParameterTypeOwner => FMOne type: #FASTJavaParameter opposite: #type',
		'#javaParameterVariableOwner => FMOne type: #FASTJavaParameter opposite: #variable',
		'#javaTypePatternVariableOwner => FMOne type: #FASTJavaTypePattern opposite: #variable',
		'#javaVarDeclTypeOwner => FMOne type: #FASTJavaVarDeclStatement opposite: #type',
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
FASTJavaVariableExpression >> javaCastExpressionTypeOwner [
	"Relation named: #javaCastExpressionTypeOwner type: #FASTJavaCastExpression opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaCastExpression owner (if possible)'>
	<container>
	<derived>
	^ javaCastExpressionTypeOwner
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaCastExpressionTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaCastExpressionTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaCatchParameterOwnler [
	"Relation named: #javaCatchParameterOwnler type: #FASTJavaCatchPartStatement opposite: #parameter"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaCatchPartParameterOwner owner (if possible)'>
	<container>
	<derived>
	^ javaCatchParameterOwnler
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaCatchParameterOwnler: anObject [

	<ignoreForCoverage>
	<generated>
	javaCatchParameterOwnler := anObject
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaClassPropertyOwner [
	"Relation named: #javaClassPropertyOwner type: #FASTJavaClassProperty opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaClassProperty owner (if possible)'>
	<container>
	<derived>
	^ javaClassPropertyOwner
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaClassPropertyOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaClassPropertyOwner := anObject
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaMethodTypeOwner [
	"Relation named: #javaMethodTypeOwner type: #FASTJavaMethodEntity opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	^ javaMethodTypeOwner
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaMethodTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaMethodTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaNewExpressionOwner [
	"Relation named: #javaNewExpressionOwner type: #FASTJavaNewExpression opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaNewExpression owner (if possible)'>
	<container>
	<derived>
	^ javaNewExpressionOwner
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaNewExpressionOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaNewExpressionOwner := anObject
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaOuterThisOwner [
	"Relation named: #javaOuterThisOwner type: #FASTJavaOuterThis opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaOuterThis owner (if possible)'>
	<container>
	<derived>
	^ javaOuterThisOwner
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaOuterThisOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaOuterThisOwner := anObject
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaParameterTypeOwner [
	"Relation named: #javaParameterTypeOwner type: #FASTJavaParameter opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	^ javaParameterTypeOwner
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaParameterTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaParameterTypeOwner := anObject
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
FASTJavaVariableExpression >> javaVarDeclTypeOwner [
	"Relation named: #javaVarDeclTypeOwner type: #FASTJavaVarDeclStatement opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	^ javaVarDeclTypeOwner
]

{ #category : 'accessing' }
FASTJavaVariableExpression >> javaVarDeclTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaVarDeclTypeOwner := anObject
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
