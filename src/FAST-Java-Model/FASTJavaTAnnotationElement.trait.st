"
I can be used as an annotation ""argument"" eg: @SuppressWarnings(value=""unchecked"")
	Acceptable annotation elements are: literal, Enum constant, Annotation, Class, an array of the preceding (out of laziness we use ArrayInitializer which is too permissive)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arrayOwner` | `FASTJavaTAnnotationElement` | `values` | `FASTJavaArrayAnnotationElement` | The ArrayAnnotationElement I am an element of|
| `parentAnnotation` | `FASTJavaTAnnotationElement` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, eg. ""unchecked"" in the following annotation:
	@SuppressWarnings(value=""unchecked"")|



"
Trait {
	#name : #FASTJavaTAnnotationElement,
	#instVars : [
		'#parentAnnotation => FMOne type: #FASTJavaAnnotation opposite: #elements',
		'#arrayOwner => FMOne type: #FASTJavaArrayAnnotationElement opposite: #values'
	],
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #meta }
FASTJavaTAnnotationElement classSide >> annotation [

	<FMClass: #TAnnotationElement super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaTAnnotationElement >> arrayOwner [
	"Relation named: #arrayOwner type: #FASTJavaArrayAnnotationElement opposite: #values"

	<generated>
	<FMComment: 'The ArrayAnnotationElement I am an element of'>
	<container>
	^ arrayOwner
]

{ #category : #accessing }
FASTJavaTAnnotationElement >> arrayOwner: anObject [

	<generated>
	arrayOwner := anObject
]

{ #category : #navigation }
FASTJavaTAnnotationElement >> arrayOwnerGroup [
	<generated>
	<navigation: 'ArrayOwner'>
	^ MooseSpecializedGroup with: self arrayOwner
]

{ #category : #accessing }
FASTJavaTAnnotationElement >> parentAnnotation [
	"Relation named: #parentAnnotation type: #FASTJavaAnnotation opposite: #elements"

	<generated>
	<FMComment: 'An "argument" of an annotation, eg. "unchecked" in the following annotation:
	@SuppressWarnings(value="unchecked")'>
	<container>
	^ parentAnnotation
]

{ #category : #accessing }
FASTJavaTAnnotationElement >> parentAnnotation: anObject [

	<generated>
	parentAnnotation := anObject
]

{ #category : #navigation }
FASTJavaTAnnotationElement >> parentAnnotationGroup [
	<generated>
	<navigation: 'ParentAnnotation'>
	^ MooseSpecializedGroup with: self parentAnnotation
]
