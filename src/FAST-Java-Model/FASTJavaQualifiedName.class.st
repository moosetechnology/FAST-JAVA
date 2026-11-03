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
| `javaDimensionExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaDimensionExpression` | The pair of brackets whose length I give|
| `javaExportsDirectiveTargetOwner` | `FASTJavaQualifiedName` | `targets` | `FASTJavaExportsDirective` | The exports directive that writes me as one of its targets|
| `javaForEachStatementOwner` | `FASTTExpression` | `list` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaOpensDirectiveTargetOwner` | `FASTJavaQualifiedName` | `targets` | `FASTJavaOpensDirective` | The opens directive that writes me as one of its targets|
| `javaProvidesDirectiveImplementationOwner` | `FASTJavaQualifiedName` | `implementations` | `FASTJavaProvidesDirective` | The provides directive that writes me as one of its implementations|
| `javaRecordPatternOwner` | `FASTTExpression` | `patterns` | `FASTJavaRecordPattern` | The record pattern that matches me as one of its components|
| `javaStringAssertStatementOwner` | `FASTTExpression` | `message` | `FASTJavaAssertStatement` | The assertion which I describe|
| `javaSynchronizedStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaThrowStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaThrowStatement` | The javaThrowStatement owner (if possible)|
| `javaTryResourceOwner` | `FASTJavaTTryResource` | `resources` | `FASTJavaTryCatchStatement` | The try-with-resource that owns me|
| `javaUnaryExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaUnaryExpression` | The javaUnaryExpression owner (if possible)|
| `javaVariableAssignmentOwner` | `FASTJavaTAssignable` | `variable` | `FASTJavaTWithAssignable` | The owner of the assignment|
| `javaVariableDeclaratorExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaVariableDeclarator` | The javaVariableDeclarator owner (if possible)|
| `namespaceOwner` | `FASTJavaQualifiedName` | `namespace` | `FASTJavaQualifiedName` | The namespace I qualify|
| `parentAnnotation` | `FASTJavaTAnnotationElement` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, eg. ""unchecked"" in the following annotation: 	@SuppressWarnings(value=""unchecked"")|
| `parentConditional` | `FASTTExpression` | `condition` | `FASTTWithCondition` | Optional condition statement/expression where this expression is used|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `qualifiedNameOwner` | `FASTJavaQualifiedName` | `qualifiedName` | `FASTJavaTWithQualifiedName` | The owner of the qualified name|
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
| `namespace` | `FASTJavaQualifiedName` | `namespaceOwner` | `FASTJavaQualifiedName` | The namespace that qualifies me|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaQualifiedName',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTAnnotationElement + FASTJavaTAssignable + FASTJavaTReceiver + FASTJavaTTryResource + FASTTEntity + FASTTExpression + FASTTNamedEntity',
	#classTraits : 'FASTJavaTAnnotationElement classTrait + FASTJavaTAssignable classTrait + FASTJavaTReceiver classTrait + FASTJavaTTryResource classTrait + FASTTEntity classTrait + FASTTExpression classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#javaExportsDirectiveTargetOwner => FMOne type: #FASTJavaExportsDirective opposite: #targets',
		'#javaOpensDirectiveTargetOwner => FMOne type: #FASTJavaOpensDirective opposite: #targets',
		'#javaProvidesDirectiveImplementationOwner => FMOne type: #FASTJavaProvidesDirective opposite: #implementations',
		'#namespace => FMOne type: #FASTJavaQualifiedName opposite: #namespaceOwner',
		'#namespaceOwner => FMOne type: #FASTJavaQualifiedName opposite: #namespace',
		'#qualifiedNameOwner => FMOne type: #FASTJavaTWithQualifiedName opposite: #qualifiedName'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaQualifiedName class >> annotation [

	<ignoreForCoverage>
	<FMClass: #QualifiedName super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaQualifiedName >> isQualifiedName [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> javaExportsDirectiveTargetOwner [
	"Relation named: #javaExportsDirectiveTargetOwner type: #FASTJavaExportsDirective opposite: #targets"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The exports directive that writes me as one of its targets'>
	<container>
	^ javaExportsDirectiveTargetOwner
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> javaExportsDirectiveTargetOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaExportsDirectiveTargetOwner := anObject
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> javaOpensDirectiveTargetOwner [
	"Relation named: #javaOpensDirectiveTargetOwner type: #FASTJavaOpensDirective opposite: #targets"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The opens directive that writes me as one of its targets'>
	<container>
	^ javaOpensDirectiveTargetOwner
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> javaOpensDirectiveTargetOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaOpensDirectiveTargetOwner := anObject
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> javaProvidesDirectiveImplementationOwner [
	"Relation named: #javaProvidesDirectiveImplementationOwner type: #FASTJavaProvidesDirective opposite: #implementations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The provides directive that writes me as one of its implementations'>
	<container>
	^ javaProvidesDirectiveImplementationOwner
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> javaProvidesDirectiveImplementationOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaProvidesDirectiveImplementationOwner := anObject
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> namespace [
	"Relation named: #namespace type: #FASTJavaQualifiedName opposite: #namespaceOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The namespace that qualifies me'>
	^ namespace
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> namespace: anObject [

	<ignoreForCoverage>
	<generated>
	namespace := anObject
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> namespaceOwner [
	"Relation named: #namespaceOwner type: #FASTJavaQualifiedName opposite: #namespace"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The namespace I qualify'>
	<container>
	<derived>
	^ namespaceOwner
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> namespaceOwner: anObject [

	<ignoreForCoverage>
	<generated>
	namespaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> qualifiedNameOwner [
	"Relation named: #qualifiedNameOwner type: #FASTJavaTWithQualifiedName opposite: #qualifiedName"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The owner of the qualified name'>
	<container>
	<derived>
	^ qualifiedNameOwner
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> qualifiedNameOwner: anObject [

	<ignoreForCoverage>
	<generated>
	qualifiedNameOwner := anObject
]
