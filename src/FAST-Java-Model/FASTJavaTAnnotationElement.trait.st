"
I am an element value (JLS 9.7.1): what an element-value pair gives, what a single-element annotation gives, what an element value array holds, and the default value of an annotation element. Java writes one as a constant expression, a class literal, an enum constant, an annotation, or an array of element values.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arrayOwner` | `FASTJavaTAnnotationElement` | `values` | `FASTJavaArrayAnnotationElement` | The ArrayAnnotationElement I am an element of|
| `defaultValueOwner` | `FASTJavaTAnnotationElement` | `defaultValue` | `FASTJavaAnnotationElementDeclaration` | The annotation element declaration I am the default value of|
| `elementValuePairOwner` | `FASTJavaTAnnotationElement` | `value` | `FASTJavaElementValuePair` | The element-value pair I am the value of|
| `parentAnnotation` | `FASTJavaTAnnotationArgument` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, e.g. ""unchecked"" in the following annotation: 	@SuppressWarnings(value=""unchecked"")|



"
Trait {
	#name : 'FASTJavaTAnnotationElement',
	#instVars : [
		'#arrayOwner => FMOne type: #FASTJavaArrayAnnotationElement opposite: #values',
		'#defaultValueOwner => FMOne type: #FASTJavaAnnotationElementDeclaration opposite: #defaultValue',
		'#elementValuePairOwner => FMOne type: #FASTJavaElementValuePair opposite: #value'
	],
	#traits : 'FASTJavaTAnnotationArgument',
	#classTraits : 'FASTJavaTAnnotationArgument classTrait',
	#category : 'FAST-Java-Model-Traits',
	#package : 'FAST-Java-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTJavaTAnnotationElement classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TAnnotationElement super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaTAnnotationElement >> arrayOwner [
	"Relation named: #arrayOwner type: #FASTJavaArrayAnnotationElement opposite: #values"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The ArrayAnnotationElement I am an element of'>
	<container>
	^ arrayOwner
]

{ #category : 'accessing' }
FASTJavaTAnnotationElement >> arrayOwner: anObject [

	<ignoreForCoverage>
	<generated>
	arrayOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTAnnotationElement >> defaultValueOwner [
	"Relation named: #defaultValueOwner type: #FASTJavaAnnotationElementDeclaration opposite: #defaultValue"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The annotation element declaration I am the default value of'>
	<container>
	<derived>
	^ defaultValueOwner
]

{ #category : 'accessing' }
FASTJavaTAnnotationElement >> defaultValueOwner: anObject [

	<ignoreForCoverage>
	<generated>
	defaultValueOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTAnnotationElement >> elementValuePairOwner [
	"Relation named: #elementValuePairOwner type: #FASTJavaElementValuePair opposite: #value"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The element-value pair I am the value of'>
	<container>
	^ elementValuePairOwner
]

{ #category : 'accessing' }
FASTJavaTAnnotationElement >> elementValuePairOwner: anObject [

	<ignoreForCoverage>
	<generated>
	elementValuePairOwner := anObject
]
