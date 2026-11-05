"
I reprensent a Java Annotation

example:

@Override

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
| `javaAnnotationOwner` | `FASTJavaAnnotation` | `annotations` | `FASTJavaTWithAnnotations` | The element I am written on|
| `javaArrayAccessOwner` | `FASTTExpression` | `expression` | `FASTJavaArrayAccess` | The javaArrayAccess owner (if possible)|
| `javaArrayArrayAccessOwner` | `FASTTExpression` | `array` | `FASTJavaArrayAccess` | The javaArrayArrayAccess owner (if possible)|
| `javaArrayInitializers` | `FASTTExpression` | `initializers` | `FASTJavaArrayInitializer` | The owner of the expression|
| `javaArrayTypeNameOwner` | `FASTTExpression` | `baseType` | `FASTJavaArrayTypeExpression` | The variable expression owner (if possible)|
| `javaAssignmentExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaAssignmentExpression` | The javaAssignmentExpression owner (if possible)|
| `javaCastExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaCastExpression` | The javaCastExpression owner (if possible)|
| `javaForEachStatementOwner` | `FASTTExpression` | `list` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaModifierOwner` | `FASTJavaTModifier` | `modifiers` | `FASTJavaTWithModifiers` | The owner of the modifier|
| `javaNewArrayInitialOwner` | `FASTTExpression` | `initializer` | `FASTJavaNewArray` | I belong to a new array initialization|
| `javaRecordPatternOwner` | `FASTTExpression` | `patterns` | `FASTJavaRecordPattern` | The record pattern that matches me as one of its components|
| `javaStringAssertStatementOwner` | `FASTTExpression` | `message` | `FASTJavaAssertStatement` | The assertion which I describe|
| `javaSynchronizedStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaThrowStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaThrowStatement` | The javaThrowStatement owner (if possible)|
| `javaUnaryExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaUnaryExpression` | The javaUnaryExpression owner (if possible)|
| `javaVariableDeclaratorExpressionOwner` | `FASTTExpression` | `expression` | `FASTJavaVariableDeclarator` | The javaVariableDeclarator owner (if possible)|
| `parentAnnotation` | `FASTJavaTAnnotationElement` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, eg. ""unchecked"" in the following annotation: 	@SuppressWarnings(value=""unchecked"")|
| `parentConditional` | `FASTTExpression` | `condition` | `FASTTWithCondition` | Optional condition statement/expression where this expression is used|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|
| `switchConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaSwitchStatement` | I represent a condition for my owner|
| `switchExpressionConditionOwner` | `FASTTExpression` | `condition` | `FASTJavaSwitchExpression` | The switch expression whose condition I am|
| `switchLabelGuardOwner` | `FASTTExpression` | `guard` | `FASTJavaSwitchLabel` | The switch label I guard|
| `switchLabelOwner` | `FASTTExpression` | `caseExpressions` | `FASTJavaSwitchLabel` | The switch label that owns me|
| `yieldStatementOwner` | `FASTTExpression` | `expression` | `FASTJavaYieldStatement` | The yield statement that owns me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `elements` | `FASTJavaAnnotation` | `parentAnnotation` | `FASTJavaTAnnotationElement` | ""Arguments"" of the annotation, eg. this @Author annotation has two annotation elements: 	@Author(name=""Benjamin Franklin"", date=""3/27/2003"")|
| `qualifiedName` | `FASTJavaTWithQualifiedName` | `qualifiedNameOwner` | `FASTJavaQualifiedName` | The name that qualifies me|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `hasParentheses` | `Boolean` | false | Whether parentheses are written after my name, which tells `@A()` from `@A` when no element value is given (JLS 9.7)|
| `name` | `String` | nil | |
| `numberOfParentheses` | `Number` | nil | How many pairs of parentheses are written around me, as the two around `a` in `((a))`; nil where none is (JLS 15.8.5)|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaAnnotation',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTAnnotationElement + FASTJavaTModifier + FASTJavaTWithQualifiedName + FASTTExpression + FASTTNamedEntity',
	#classTraits : 'FASTJavaTAnnotationElement classTrait + FASTJavaTModifier classTrait + FASTJavaTWithQualifiedName classTrait + FASTTExpression classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#elements => FMMany type: #FASTJavaTAnnotationElement opposite: #parentAnnotation',
		'#hasParentheses => FMProperty defaultValue: false',
		'#javaAnnotationOwner => FMOne type: #FASTJavaTWithAnnotations opposite: #annotations'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaAnnotation class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Annotation super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaAnnotation >> addElement: anObject [

	<ignoreForCoverage>
	<generated>
	^ self elements add: anObject
]

{ #category : 'accessing' }
FASTJavaAnnotation >> elements [
	"Relation named: #elements type: #FASTJavaTAnnotationElement opposite: #parentAnnotation"

	<ignoreForCoverage>
	<generated>
	<FMComment: '"Arguments" of the annotation, eg. this @Author annotation has two annotation elements:
	@Author(name="Benjamin Franklin", date="3/27/2003")'>
	<derived>
	^ elements
]

{ #category : 'accessing' }
FASTJavaAnnotation >> elements: anObject [

	<ignoreForCoverage>
	<generated>
	elements value: anObject
]

{ #category : 'accessing' }
FASTJavaAnnotation >> hasParentheses [

	<FMProperty: #hasParentheses type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Whether parentheses are written after my name, which tells `@A()` from `@A` when no element value is given (JLS 9.7)'>
	^ hasParentheses ifNil: [ hasParentheses := false ]
]

{ #category : 'accessing' }
FASTJavaAnnotation >> hasParentheses: anObject [
	<ignoreForCoverage>
	<generated>
	hasParentheses := anObject
]

{ #category : 'testing' }
FASTJavaAnnotation >> isAnnotation [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaAnnotation >> javaAnnotationOwner [
	"Relation named: #javaAnnotationOwner type: #FASTJavaTWithAnnotations opposite: #annotations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The element I am written on'>
	<container>
	^ javaAnnotationOwner
]

{ #category : 'accessing' }
FASTJavaAnnotation >> javaAnnotationOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaAnnotationOwner := anObject
]
