"
I can be used as an annotation ""argument"" eg: @SuppressWarnings(value=""unchecked"")
	Acceptable annotation elements are: literal, Enum constant, Annotation, Class, an array of the preceding (out of laziness we use ArrayInitializer which is too permissive)
"
Trait {
	#name : #FASTJavaTAnnotationElement,
	#instVars : [
		'#parentAnnotation => FMOne type: #FASTJavaAnnotation opposite: #elements'
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
FASTJavaTAnnotationElement >> parentAnnotation [
	"Relation named: #parentAnnotation type: #FASTJavaAnnotation opposite: #elements"

	<generated>
	<FMComment: 'An "argument" of an annotation, eg. "unchecked" in the following annotation:
	@SuppressWarnings(value="unchecked")'>
	^ parentAnnotation
]

{ #category : #accessing }
FASTJavaTAnnotationElement >> parentAnnotation: anObject [

	<generated>
	parentAnnotation := anObject
]
