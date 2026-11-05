"
I am what an annotation gives between its parentheses: an element-value pair, as `value = ""unchecked""` is in `@SuppressWarnings(value = ""unchecked"")`, or the single element value of a single-element annotation, as `""unchecked""` is in `@SuppressWarnings(""unchecked"")` (JLS 9.7.1).

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentAnnotation` | `FASTJavaTAnnotationArgument` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, eg. ""unchecked"" in the following annotation: 	@SuppressWarnings(value=""unchecked"")|



"
Trait {
	#name : 'FASTJavaTAnnotationArgument',
	#instVars : [
		'#parentAnnotation => FMOne type: #FASTJavaAnnotation opposite: #elements'
	],
	#category : 'FAST-Java-Model-Traits',
	#package : 'FAST-Java-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTJavaTAnnotationArgument classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TAnnotationArgument super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaTAnnotationArgument >> parentAnnotation [
	"Relation named: #parentAnnotation type: #FASTJavaAnnotation opposite: #elements"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'An "argument" of an annotation, eg. "unchecked" in the following annotation:
	@SuppressWarnings(value="unchecked")'>
	<container>
	^ parentAnnotation
]

{ #category : 'accessing' }
FASTJavaTAnnotationArgument >> parentAnnotation: anObject [

	<ignoreForCoverage>
	<generated>
	parentAnnotation := anObject
]
