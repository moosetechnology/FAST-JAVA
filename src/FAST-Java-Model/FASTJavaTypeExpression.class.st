"
I am an abstract class representing a type

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
| `javaArrayBaseTypeOwner` | `FASTJavaTypeExpression` | `baseType` | `FASTJavaArrayTypeExpression` | The array type that makes an array of me|
| `javaArrayInitializers` | `FASTTExpression` | `initializers` | `FASTJavaArrayInitializer` | The owner of the expression|
| `javaAssignmentExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaAssignmentExpression` | The javaAssignmentExpression owner (if possible)|
| `javaCastExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaCastExpression` | The javaCastExpression owner (if possible)|
| `javaCastExpressionTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaCastExpression` | The javaCastExpression owner (if possible)|
| `javaClassLiteralTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaClassLiteral` | The class literal that reads my Class object|
| `javaDimensionExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaDimensionExpression` | The pair of brackets whose length I give|
| `javaForEachStatementOwner` | `FASTTExpression` | `list` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaForEachStatementTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaMethodInvocationTypeArgumentOwner` | `FASTJavaTypeExpression` | `typeArguments` | `FASTJavaMethodInvocation` | The invocation that writes me as one of its type arguments|
| `javaMethodReferenceTypeArgumentOwner` | `FASTJavaTypeExpression` | `typeArguments` | `FASTJavaMethodReference` | The method reference that writes me as one of its type arguments|
| `javaMethodTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaMethodEntity` | The variable expression owner (if possible)|
| `javaNewArrayTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaNewArray` | The array creation that makes an array of me|
| `javaNewExpressionTypeArgumentOwner` | `FASTJavaTypeExpression` | `typeArguments` | `FASTJavaNewExpression` | The creation that writes me as one of its type arguments|
| `javaParameterTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaParameter` | The variable expression owner (if possible)|
| `javaReceiverParameterTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaReceiverParameter` | The receiver parameter that writes me|
| `javaRecordPatternOwner` | `FASTTExpression` | `patterns` | `FASTJavaRecordPattern` | The record pattern that matches me as one of its components|
| `javaRecordPatternTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaRecordPattern` | The record pattern that matches me|
| `javaStringAssertStatementOwner` | `FASTTExpression` | `message` | `FASTJavaAssertStatement` | The assertion which I describe|
| `javaSynchronizedStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaThrowStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaThrowStatement` | The javaThrowStatement owner (if possible)|
| `javaTypePatternTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaTypePattern` | The javaTypePattern type owner (if possible)|
| `javaUnaryExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaUnaryExpression` | The javaUnaryExpression owner (if possible)|
| `javaVarDeclTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaVarDeclStatement` | The variable expression owner (if possible)|
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
| `typeParameterOwner` | `FASTJavaTypeExpression` | `types` | `FASTJavaTypeParameterExpression` | The type parameter I specify|
| `typeParameterSuperTypeOwner` | `FASTJavaTypeExpression` | `superType` | `FASTJavaTypeParameterExpression` | The wildcard I bound from below|
| `yieldStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaYieldStatement` | The yield statement that owns me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotations` | `FASTJavaTWithAnnotations` | `javaAnnotationOwner` | `FASTJavaAnnotation` | The annotations written on me|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaTypeExpression',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTReceiver + FASTJavaTWithAnnotations + FASTTExpression',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTJavaTWithAnnotations classTrait + FASTTExpression classTrait',
	#instVars : [
		'#javaArrayBaseTypeOwner => FMOne type: #FASTJavaArrayTypeExpression opposite: #baseType',
		'#javaCastExpressionTypeOwner => FMOne type: #FASTJavaCastExpression opposite: #type',
		'#javaClassLiteralTypeOwner => FMOne type: #FASTJavaClassLiteral opposite: #type',
		'#javaForEachStatementTypeOwner => FMOne type: #FASTJavaForEachStatement opposite: #type',
		'#javaMethodInvocationTypeArgumentOwner => FMOne type: #FASTJavaMethodInvocation opposite: #typeArguments',
		'#javaMethodReferenceTypeArgumentOwner => FMOne type: #FASTJavaMethodReference opposite: #typeArguments',
		'#javaMethodTypeOwner => FMOne type: #FASTJavaMethodEntity opposite: #type',
		'#javaNewArrayTypeOwner => FMOne type: #FASTJavaNewArray opposite: #type',
		'#javaNewExpressionTypeArgumentOwner => FMOne type: #FASTJavaNewExpression opposite: #typeArguments',
		'#javaParameterTypeOwner => FMOne type: #FASTJavaParameter opposite: #type',
		'#javaReceiverParameterTypeOwner => FMOne type: #FASTJavaReceiverParameter opposite: #type',
		'#javaRecordPatternTypeOwner => FMOne type: #FASTJavaRecordPattern opposite: #type',
		'#javaTypePatternTypeOwner => FMOne type: #FASTJavaTypePattern opposite: #type',
		'#javaVarDeclTypeOwner => FMOne type: #FASTJavaVarDeclStatement opposite: #type',
		'#typeParameterOwner => FMOne type: #FASTJavaTypeParameterExpression opposite: #types',
		'#typeParameterSuperTypeOwner => FMOne type: #FASTJavaTypeParameterExpression opposite: #superType'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaTypeExpression class >> annotation [

	<ignoreForCoverage>
	<FMClass: #TypeExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaTypeExpression >> isTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaArrayBaseTypeOwner [
	"Relation named: #javaArrayBaseTypeOwner type: #FASTJavaArrayTypeExpression opposite: #baseType"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The array type that makes an array of me'>
	<container>
	^ javaArrayBaseTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaArrayBaseTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaArrayBaseTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaCastExpressionTypeOwner [
	"Relation named: #javaCastExpressionTypeOwner type: #FASTJavaCastExpression opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaCastExpression owner (if possible)'>
	<container>
	^ javaCastExpressionTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaCastExpressionTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaCastExpressionTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaClassLiteralTypeOwner [
	"Relation named: #javaClassLiteralTypeOwner type: #FASTJavaClassLiteral opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The class literal that reads my Class object'>
	<container>
	^ javaClassLiteralTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaClassLiteralTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaClassLiteralTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaForEachStatementTypeOwner [
	"Relation named: #javaForEachStatementTypeOwner type: #FASTJavaForEachStatement opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaForEachStatement owner (if possible)'>
	<container>
	<derived>
	^ javaForEachStatementTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaForEachStatementTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaForEachStatementTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaMethodInvocationTypeArgumentOwner [
	"Relation named: #javaMethodInvocationTypeArgumentOwner type: #FASTJavaMethodInvocation opposite: #typeArguments"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The invocation that writes me as one of its type arguments'>
	<container>
	^ javaMethodInvocationTypeArgumentOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaMethodInvocationTypeArgumentOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaMethodInvocationTypeArgumentOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaMethodReferenceTypeArgumentOwner [
	"Relation named: #javaMethodReferenceTypeArgumentOwner type: #FASTJavaMethodReference opposite: #typeArguments"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The method reference that writes me as one of its type arguments'>
	<container>
	^ javaMethodReferenceTypeArgumentOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaMethodReferenceTypeArgumentOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaMethodReferenceTypeArgumentOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaMethodTypeOwner [
	"Relation named: #javaMethodTypeOwner type: #FASTJavaMethodEntity opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	^ javaMethodTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaMethodTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaMethodTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaNewArrayTypeOwner [
	"Relation named: #javaNewArrayTypeOwner type: #FASTJavaNewArray opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The array creation that makes an array of me'>
	<container>
	^ javaNewArrayTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaNewArrayTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaNewArrayTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaNewExpressionTypeArgumentOwner [
	"Relation named: #javaNewExpressionTypeArgumentOwner type: #FASTJavaNewExpression opposite: #typeArguments"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The creation that writes me as one of its type arguments'>
	<container>
	^ javaNewExpressionTypeArgumentOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaNewExpressionTypeArgumentOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaNewExpressionTypeArgumentOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaParameterTypeOwner [
	"Relation named: #javaParameterTypeOwner type: #FASTJavaParameter opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	^ javaParameterTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaParameterTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaParameterTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaReceiverParameterTypeOwner [
	"Relation named: #javaReceiverParameterTypeOwner type: #FASTJavaReceiverParameter opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The receiver parameter that writes me'>
	<container>
	<derived>
	^ javaReceiverParameterTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaReceiverParameterTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaReceiverParameterTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaRecordPatternTypeOwner [
	"Relation named: #javaRecordPatternTypeOwner type: #FASTJavaRecordPattern opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The record pattern that matches me'>
	<container>
	<derived>
	^ javaRecordPatternTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaRecordPatternTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaRecordPatternTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaTypePatternTypeOwner [
	"Relation named: #javaTypePatternTypeOwner type: #FASTJavaTypePattern opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaTypePattern type owner (if possible)'>
	<container>
	<derived>
	^ javaTypePatternTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaTypePatternTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaTypePatternTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaVarDeclTypeOwner [
	"Relation named: #javaVarDeclTypeOwner type: #FASTJavaVarDeclStatement opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	^ javaVarDeclTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaVarDeclTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaVarDeclTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> typeParameterOwner [
	"Relation named: #typeParameterOwner type: #FASTJavaTypeParameterExpression opposite: #types"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The type parameter I specify'>
	<container>
	^ typeParameterOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> typeParameterOwner: anObject [

	<ignoreForCoverage>
	<generated>
	typeParameterOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> typeParameterSuperTypeOwner [
	"Relation named: #typeParameterSuperTypeOwner type: #FASTJavaTypeParameterExpression opposite: #superType"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The wildcard I bound from below'>
	<container>
	<derived>
	^ typeParameterSuperTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> typeParameterSuperTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	typeParameterSuperTypeOwner := anObject
]
