"
I am an element-value pair of an annotation (JLS 9.7.1): the name of an element of the annotation interface, `=`, and the value given to it, as `value = ""unchecked""` is in `@SuppressWarnings(value = ""unchecked"")`.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `parentAnnotation` | `FASTJavaTAnnotationArgument` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, eg. ""unchecked"" in the following annotation: 	@SuppressWarnings(value=""unchecked"")|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `value` | `FASTJavaElementValuePair` | `elementValuePairOwner` | `FASTJavaTAnnotationElement` | The element value I give, eg. ""unchecked"" in `@SuppressWarnings(value = ""unchecked"")`|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaElementValuePair',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTAnnotationArgument + FASTTNamedEntity',
	#classTraits : 'FASTJavaTAnnotationArgument classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#value => FMOne type: #FASTJavaTAnnotationElement opposite: #elementValuePairOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaElementValuePair class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ElementValuePair super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaElementValuePair >> isElementValuePair [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaElementValuePair >> value [
	"Relation named: #value type: #FASTJavaTAnnotationElement opposite: #elementValuePairOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The element value I give, eg. "unchecked" in `@SuppressWarnings(value = "unchecked")`'>
	^ value
]

{ #category : 'accessing' }
FASTJavaElementValuePair >> value: anObject [

	<ignoreForCoverage>
	<generated>
	value := anObject
]
