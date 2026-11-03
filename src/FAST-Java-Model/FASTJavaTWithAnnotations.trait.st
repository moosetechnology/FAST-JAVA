"
I hold the annotations written on me, which is every annotation a construct carries.

A declaration writes its annotations and its keywords in one list and in any order it likes
(JLS 8.1.1), and the JLS writes `{Annotation}` alone wherever a keyword would mean nothing:
on a type parameter and its bounds (4.4), on a type wherever one is written (4.11), on a
package declaration (7.4.1), on a module declaration (7.7), on a receiver parameter (8.4.1),
on an enum constant (8.9.1) and on a pair of brackets (10.2). An annotation is not a modifier
in either place, so I hold it and `modifiers` holds the keywords. The order the source writes
them in is the order their positions give.

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
