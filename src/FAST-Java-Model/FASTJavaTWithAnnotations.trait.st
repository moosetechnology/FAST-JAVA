"
I carry annotations and nothing else, where a declaration would carry modifiers.

The JLS writes `{Annotation}` rather than a modifier list wherever a keyword would mean
nothing: on a type parameter and its bounds (JLS 4.4), on a type wherever one is written
(4.11), on a package declaration (7.4.1), on a module declaration (7.7), on a receiver
parameter (8.4.1), on an enum constant (8.9.1) and on a pair of brackets (10.2).

Holding these in `modifiers` would let any of them carry `public` or `static`, which no
Java compiler accepts there, so they are held apart.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotations` | `FASTJavaTWithAnnotations` | `javaAnnotationOwner` | `FASTJavaAnnotation` | The annotations written on me|



"
Trait {
	#name : 'FASTJavaTWithAnnotations',
	#instVars : [
		'#annotations => FMMany type: #FASTJavaAnnotation opposite: #javaAnnotationOwner'
	],
	#category : 'FAST-Java-Model-Traits',
	#package : 'FAST-Java-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTJavaTWithAnnotations classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithAnnotations super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaTWithAnnotations >> addAnnotation: anObject [

	<ignoreForCoverage>
	<generated>
	^ self annotations add: anObject
]

{ #category : 'accessing' }
FASTJavaTWithAnnotations >> annotations [
	"Relation named: #annotations type: #FASTJavaAnnotation opposite: #javaAnnotationOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The annotations written on me'>
	^ annotations
]

{ #category : 'accessing' }
FASTJavaTWithAnnotations >> annotations: anObject [

	<ignoreForCoverage>
	<generated>
	annotations value: anObject
]
