"
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
| `javaCastExpressionTypeOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaCastExpression` | The javaCastExpression owner (if possible)|
| `javaCatchParameterOwnler` | `FASTJavaVariableExpression` | `parameter` | `FASTJavaCatchPartStatement` | The javaCatchPartParameterOwner owner (if possible)|
| `javaClassPropertyOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaClassProperty` | The javaClassProperty owner (if possible)|
| `javaForEachStatementOwner` | `FASTTExpression` | `list` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaLabeledCaseStatementOwner` | `FASTTExpression` | `label` | `FASTJavaLabeledCaseStatement` | The javaLabeledCaseStatement owner (if possible)|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `javaMethodReferenceOwner` | `FASTJavaVariableExpression` | `receiver` | `FASTJavaMethodReference` | The owner of the method reference (if possible)|
| `javaMethodTypeOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaMethodEntity` | The variable expression owner (if possible)|
| `javaNewArrayInitialOwner` | `FASTTExpression` | `initializer` | `FASTJavaNewArray` | I belong to a new array initialization|
| `javaNewExpressionOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaNewExpression` | The javaNewExpression owner (if possible)|
| `javaOuterThisOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaOuterThis` | The javaOuterThis owner (if possible)|
| `javaParameterTypeOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaParameter` | The variable expression owner (if possible)|
| `javaParameterVariableOwner` | `FASTJavaVariableExpression` | `variable` | `FASTJavaParameter` | The variable expression owner (if possible)|
| `javaStringAssertStatementOwner` | `FASTTExpression` | `message` | `FASTJavaAssertStatement` | The assertion which I describe|
| `javaSynchronizedStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaThrowStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaThrowStatement` | The javaThrowStatement owner (if possible)|
| `javaTypePatternVariableOwner` | `FASTJavaVariableExpression` | `variable` | `FASTJavaTypePattern` | The javaTypePattern variable owner (if possible)|
| `javaUnaryExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaUnaryExpression` | The javaUnaryExpression owner (if possible)|
| `javaVarDeclTypeOwner` | `FASTJavaVariableExpression` | `type` | `FASTJavaVarDeclStatement` | The variable expression owner (if possible)|
| `javaVariableAssignmentOwner` | `FASTJavaTAssignable` | `variable` | `FASTJavaTWithAssignable` | The owner of the assignment|
| `javaVariableDeclaratorExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaVariableDeclarator` | The javaVariableDeclarator owner (if possible)|
| `javaVariableDeclaratorOwner` | `FASTJavaVariableExpression` | `variable` | `FASTJavaVariableDeclarator` | The javaVariableDeclarator owner (if possible)|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `receiverOwner` | `FASTJavaTReceiver` | `receiver` | `FASTJavaTWithReceiver` | The owner of the receiver|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `switchConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaSwitchStatement` | I represent a condition for my owner|
| `whileConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaWhileStatement` | I represent a condition for my owner|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaVariableExpression,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAssignable + FASTJavaTReceiver + FASTTVariableExpression',
	#classTraits : 'FASTJavaTAssignable classTrait + FASTJavaTReceiver classTrait + FASTTVariableExpression classTrait',
	#instVars : [
		'#javaCastExpressionTypeOwner => FMOne type: #FASTJavaCastExpression opposite: #type',
		'#javaCatchParameterOwnler => FMOne type: #FASTJavaCatchPartStatement opposite: #parameter',
		'#javaClassPropertyOwner => FMOne type: #FASTJavaClassProperty opposite: #type',
		'#javaMethodReferenceOwner => FMOne type: #FASTJavaMethodReference opposite: #receiver',
		'#javaMethodTypeOwner => FMOne type: #FASTJavaMethodEntity opposite: #type',
		'#javaNewExpressionOwner => FMOne type: #FASTJavaNewExpression opposite: #type',
		'#javaOuterThisOwner => FMOne type: #FASTJavaOuterThis opposite: #type',
		'#javaParameterTypeOwner => FMOne type: #FASTJavaParameter opposite: #type',
		'#javaParameterVariableOwner => FMOne type: #FASTJavaParameter opposite: #variable',
		'#javaTypePatternVariableOwner => FMOne type: #FASTJavaTypePattern opposite: #variable',
		'#javaVarDeclTypeOwner => FMOne type: #FASTJavaVarDeclStatement opposite: #type',
		'#javaVariableDeclaratorOwner => FMOne type: #FASTJavaVariableDeclarator opposite: #variable'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaVariableExpression class >> annotation [

	<FMClass: #VariableExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaCastExpressionTypeOwner [
	"Relation named: #javaCastExpressionTypeOwner type: #FASTJavaCastExpression opposite: #type"

	<generated>
	<FMComment: 'The javaCastExpression owner (if possible)'>
	<container>
	<derived>
	^ javaCastExpressionTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaCastExpressionTypeOwner: anObject [

	<generated>
	javaCastExpressionTypeOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaCastExpressionTypeOwnerGroup [
	<generated>
	<navigation: 'JavaCastExpressionTypeOwner'>
	^ MooseSpecializedGroup with: self javaCastExpressionTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaCatchParameterOwnler [
	"Relation named: #javaCatchParameterOwnler type: #FASTJavaCatchPartStatement opposite: #parameter"

	<generated>
	<FMComment: 'The javaCatchPartParameterOwner owner (if possible)'>
	<container>
	<derived>
	^ javaCatchParameterOwnler
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaCatchParameterOwnler: anObject [

	<generated>
	javaCatchParameterOwnler := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaCatchParameterOwnlerGroup [
	<generated>
	<navigation: 'JavaCatchParameterOwnler'>
	^ MooseSpecializedGroup with: self javaCatchParameterOwnler
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaClassPropertyOwner [
	"Relation named: #javaClassPropertyOwner type: #FASTJavaClassProperty opposite: #type"

	<generated>
	<FMComment: 'The javaClassProperty owner (if possible)'>
	<container>
	<derived>
	^ javaClassPropertyOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaClassPropertyOwner: anObject [

	<generated>
	javaClassPropertyOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaClassPropertyOwnerGroup [
	<generated>
	<navigation: 'JavaClassPropertyOwner'>
	^ MooseSpecializedGroup with: self javaClassPropertyOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaMethodReferenceOwner [
	"Relation named: #javaMethodReferenceOwner type: #FASTJavaMethodReference opposite: #receiver"

	<generated>
	<FMComment: 'The owner of the method reference (if possible)'>
	<container>
	<derived>
	^ javaMethodReferenceOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaMethodReferenceOwner: anObject [

	<generated>
	javaMethodReferenceOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaMethodReferenceOwnerGroup [
	<generated>
	<navigation: 'JavaMethodReferenceOwner'>
	^ MooseSpecializedGroup with: self javaMethodReferenceOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaMethodTypeOwner [
	"Relation named: #javaMethodTypeOwner type: #FASTJavaMethodEntity opposite: #type"

	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	^ javaMethodTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaMethodTypeOwner: anObject [

	<generated>
	javaMethodTypeOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaMethodTypeOwnerGroup [
	<generated>
	<navigation: 'JavaMethodTypeOwner'>
	^ MooseSpecializedGroup with: self javaMethodTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaNewExpressionOwner [
	"Relation named: #javaNewExpressionOwner type: #FASTJavaNewExpression opposite: #type"

	<generated>
	<FMComment: 'The javaNewExpression owner (if possible)'>
	<container>
	<derived>
	^ javaNewExpressionOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaNewExpressionOwner: anObject [

	<generated>
	javaNewExpressionOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaNewExpressionOwnerGroup [
	<generated>
	<navigation: 'JavaNewExpressionOwner'>
	^ MooseSpecializedGroup with: self javaNewExpressionOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaOuterThisOwner [
	"Relation named: #javaOuterThisOwner type: #FASTJavaOuterThis opposite: #type"

	<generated>
	<FMComment: 'The javaOuterThis owner (if possible)'>
	<container>
	<derived>
	^ javaOuterThisOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaOuterThisOwner: anObject [

	<generated>
	javaOuterThisOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaOuterThisOwnerGroup [
	<generated>
	<navigation: 'JavaOuterThisOwner'>
	^ MooseSpecializedGroup with: self javaOuterThisOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaParameterTypeOwner [
	"Relation named: #javaParameterTypeOwner type: #FASTJavaParameter opposite: #type"

	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	^ javaParameterTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaParameterTypeOwner: anObject [

	<generated>
	javaParameterTypeOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaParameterTypeOwnerGroup [
	<generated>
	<navigation: 'JavaParameterTypeOwner'>
	^ MooseSpecializedGroup with: self javaParameterTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaParameterVariableOwner [
	"Relation named: #javaParameterVariableOwner type: #FASTJavaParameter opposite: #variable"

	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	^ javaParameterVariableOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaParameterVariableOwner: anObject [

	<generated>
	javaParameterVariableOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaParameterVariableOwnerGroup [
	<generated>
	<navigation: 'JavaParameterVariableOwner'>
	^ MooseSpecializedGroup with: self javaParameterVariableOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaTypePatternVariableOwner [
	"Relation named: #javaTypePatternVariableOwner type: #FASTJavaTypePattern opposite: #variable"

	<generated>
	<FMComment: 'The javaTypePattern variable owner (if possible)'>
	<container>
	<derived>
	^ javaTypePatternVariableOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaTypePatternVariableOwner: anObject [

	<generated>
	javaTypePatternVariableOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaTypePatternVariableOwnerGroup [
	<generated>
	<navigation: 'JavaTypePatternVariableOwner'>
	^ MooseSpecializedGroup with: self javaTypePatternVariableOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaVarDeclTypeOwner [
	"Relation named: #javaVarDeclTypeOwner type: #FASTJavaVarDeclStatement opposite: #type"

	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	^ javaVarDeclTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaVarDeclTypeOwner: anObject [

	<generated>
	javaVarDeclTypeOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaVarDeclTypeOwnerGroup [
	<generated>
	<navigation: 'JavaVarDeclTypeOwner'>
	^ MooseSpecializedGroup with: self javaVarDeclTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaVariableDeclaratorOwner [
	"Relation named: #javaVariableDeclaratorOwner type: #FASTJavaVariableDeclarator opposite: #variable"

	<generated>
	<FMComment: 'The javaVariableDeclarator owner (if possible)'>
	<container>
	<derived>
	^ javaVariableDeclaratorOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaVariableDeclaratorOwner: anObject [

	<generated>
	javaVariableDeclaratorOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaVariableDeclaratorOwnerGroup [
	<generated>
	<navigation: 'JavaVariableDeclaratorOwner'>
	^ MooseSpecializedGroup with: self javaVariableDeclaratorOwner
]
