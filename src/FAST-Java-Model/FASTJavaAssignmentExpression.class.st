"
An assignment expression mode.

Contains a referances to an assignee assignee and the expression that's being assigned.

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
| `parentAnnotation` | `FASTJavaTAnnotationElement` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, eg. ""unchecked"" in the following annotation:
	@SuppressWarnings(value=""unchecked"")|
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
| `expression` | `FASTJavaAssignmentExpression` | `javaAssignmentExpressionOwner` | `FASTTExpression` | Expression to be assigned to the var during declaration|
| `variable` | `FASTJavaTWithAssignable` | `javaVariableAssignmentOwner` | `FASTJavaTAssignable` | My variable|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `operator` | `String` | nil | The assignement operator: =, +=, /=, ...|
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaAssignmentExpression,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAnnotationElement + FASTJavaTReceiver + FASTJavaTWithAssignable + FASTTExpression',
	#classTraits : 'FASTJavaTAnnotationElement classTrait + FASTJavaTReceiver classTrait + FASTJavaTWithAssignable classTrait + FASTTExpression classTrait',
	#instVars : [
		'#operator => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAssignmentExpression class >> annotation [

	<FMClass: #AssignmentExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaAssignmentExpression >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #javaAssignmentExpressionOwner"

	<generated>
	<FMComment: 'Expression to be assigned to the var during declaration'>
	<FMProperty: #expression type: #FASTTExpression opposite: #javaAssignmentExpressionOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaAssignmentExpression >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaAssignmentExpressionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaAssignmentExpressionOwner: self ]
]

{ #category : #navigation }
FASTJavaAssignmentExpression >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : #accessing }
FASTJavaAssignmentExpression >> operator [

	<FMProperty: #operator type: #String>
	<generated>
	<FMComment: 'The assignement operator: =, +=, /=, ...'>
	^ operator
]

{ #category : #accessing }
FASTJavaAssignmentExpression >> operator: anObject [
	<generated>
	operator := anObject
]
