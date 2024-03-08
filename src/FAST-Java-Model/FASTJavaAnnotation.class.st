"
I reprensent a Java Annotation

example:

@Override

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arrayOwner` | `FASTJavaTAnnotationElement` | `values` | `FASTJavaArrayAnnotationElement` | The ArrayAnnotationElement I am an element of|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `javaModifierOwner` | `FASTJavaTModifier` | `modifiers` | `FASTJavaTWithModifiers` | The owner of the modifier|
| `parentAnnotation` | `FASTJavaTAnnotationElement` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, eg. ""unchecked"" in the following annotation:
	@SuppressWarnings(value=""unchecked"")|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `elements` | `FASTJavaAnnotation` | `parentAnnotation` | `FASTJavaTAnnotationElement` | ""Arguments"" of the annotation, eg. this @Author annotation has two annotation elements:
	@Author(name=""Benjamin Franklin"", date=""3/27/2003"")|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaAnnotation,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAnnotationElement + FASTJavaTModifier + FASTTNamedEntity',
	#classTraits : 'FASTJavaTAnnotationElement classTrait + FASTJavaTModifier classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#elements => FMMany type: #FASTJavaTAnnotationElement opposite: #parentAnnotation'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAnnotation class >> annotation [

	<FMClass: #Annotation super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTJavaAnnotation >> addElement: anObject [
	<generated>
	^ self elements add: anObject
]

{ #category : #accessing }
FASTJavaAnnotation >> elements [
	"Relation named: #elements type: #FASTJavaTAnnotationElement opposite: #parentAnnotation"

	<generated>
	<FMComment: '"Arguments" of the annotation, eg. this @Author annotation has two annotation elements:
	@Author(name="Benjamin Franklin", date="3/27/2003")'>
	<derived>
	^ elements
]

{ #category : #accessing }
FASTJavaAnnotation >> elements: anObject [

	<generated>
	elements value: anObject
]

{ #category : #navigation }
FASTJavaAnnotation >> elementsGroup [
	<generated>
	<navigation: 'Elements'>
	^ MooseSpecializedGroup withAll: self elements asSet
]
