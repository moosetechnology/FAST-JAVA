"
I represent an array as argument of an annotationExpression

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arrayOwner` | `FASTJavaTAnnotationElement` | `values` | `FASTJavaArrayAnnotationElement` | The ArrayAnnotationElement I am an element of|
| `defaultValueOwner` | `FASTJavaTAnnotationElement` | `defaultValue` | `FASTJavaAnnotationElementDeclaration` | The annotation element declaration I am the default value of|
| `elementValuePairOwner` | `FASTJavaTAnnotationElement` | `value` | `FASTJavaElementValuePair` | The element-value pair I am the value of|
| `parentAnnotation` | `FASTJavaTAnnotationArgument` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, eg. ""unchecked"" in the following annotation: 	@SuppressWarnings(value=""unchecked"")|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `values` | `FASTJavaArrayAnnotationElement` | `arrayOwner` | `FASTJavaTAnnotationElement` | Annotation elements in the Array|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `hasTrailingComma` | `Boolean` | false | Whether a comma is written after the last value, which JLS 9.7.1 allows|

"
Class {
	#name : 'FASTJavaArrayAnnotationElement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTAnnotationElement',
	#classTraits : 'FASTJavaTAnnotationElement classTrait',
	#instVars : [
		'#hasTrailingComma => FMProperty defaultValue: false',
		'#values => FMMany type: #FASTJavaTAnnotationElement opposite: #arrayOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaArrayAnnotationElement class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ArrayAnnotationElement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaArrayAnnotationElement >> addValue: anObject [

	<ignoreForCoverage>
	<generated>
	^ self values add: anObject
]

{ #category : 'accessing' }
FASTJavaArrayAnnotationElement >> hasTrailingComma [

	<FMProperty: #hasTrailingComma type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Whether a comma is written after the last value, which JLS 9.7.1 allows'>
	^ hasTrailingComma ifNil: [ hasTrailingComma := false ]
]

{ #category : 'accessing' }
FASTJavaArrayAnnotationElement >> hasTrailingComma: anObject [
	<ignoreForCoverage>
	<generated>
	hasTrailingComma := anObject
]

{ #category : 'testing' }
FASTJavaArrayAnnotationElement >> isArrayAnnotationElement [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaArrayAnnotationElement >> values [
	"Relation named: #values type: #FASTJavaTAnnotationElement opposite: #arrayOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Annotation elements in the Array'>
	<derived>
	^ values
]

{ #category : 'accessing' }
FASTJavaArrayAnnotationElement >> values: anObject [

	<ignoreForCoverage>
	<generated>
	values value: anObject
]
