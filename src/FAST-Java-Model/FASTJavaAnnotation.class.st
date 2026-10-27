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
| `defaultValueOwner` | `FASTJavaTAnnotationElement` | `defaultValue` | `FASTJavaAnnotationElementDeclaration` | The annotation element declaration I am the default value of|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `javaModifierOwner` | `FASTJavaTModifier` | `modifiers` | `FASTJavaTWithModifiers` | The owner of the modifier|
| `parentAnnotation` | `FASTJavaTAnnotationElement` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, eg. ""unchecked"" in the following annotation: 	@SuppressWarnings(value=""unchecked"")|

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
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaAnnotation',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTAnnotationElement + FASTJavaTModifier + FASTJavaTWithQualifiedName + FASTTNamedEntity',
	#classTraits : 'FASTJavaTAnnotationElement classTrait + FASTJavaTModifier classTrait + FASTJavaTWithQualifiedName classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#elements => FMMany type: #FASTJavaTAnnotationElement opposite: #parentAnnotation'
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

{ #category : 'testing' }
FASTJavaAnnotation >> isAnnotation [

	<ignoreForCoverage>
	<generated>
	^ true
]
