"
I represent an array as argument of an annotationExpression

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
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `switchConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaSwitchStatement` | I represent a condition for my owner|
| `whileConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaWhileStatement` | I represent a condition for my owner|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `values` | `FASTJavaArrayAnnotationElement` | `arrayOwner` | `FASTJavaTAnnotationElement` | Annotation elements in the Array|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaArrayAnnotationElement,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAnnotationElement + FASTTExpression',
	#classTraits : 'FASTJavaTAnnotationElement classTrait + FASTTExpression classTrait',
	#instVars : [
		'#values => FMMany type: #FASTJavaTAnnotationElement opposite: #arrayOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaArrayAnnotationElement class >> annotation [

	<FMClass: #ArrayAnnotationElement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTJavaArrayAnnotationElement >> addValue: anObject [
	<generated>
	^ self values add: anObject
]

{ #category : #accessing }
FASTJavaArrayAnnotationElement >> values [
	"Relation named: #values type: #FASTJavaTAnnotationElement opposite: #arrayOwner"

	<generated>
	<FMComment: 'Annotation elements in the Array'>
	<derived>
	^ values
]

{ #category : #accessing }
FASTJavaArrayAnnotationElement >> values: anObject [

	<generated>
	values value: anObject
]

{ #category : #navigation }
FASTJavaArrayAnnotationElement >> valuesGroup [
	<generated>
	<navigation: 'Values'>
	^ MooseSpecializedGroup withAll: self values asSet
]
