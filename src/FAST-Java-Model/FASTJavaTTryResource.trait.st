"
I am a resource in a try-with-resource

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `javaTryResourceOwner` | `FASTJavaTTryResource` | `resources` | `FASTJavaTryCatchStatement` | The try-with-resource that owns me|



"
Trait {
	#name : 'FASTJavaTTryResource',
	#instVars : [
		'#javaTryResourceOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #resources'
	],
	#category : 'FAST-Java-Model-Traits',
	#package : 'FAST-Java-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTJavaTTryResource classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TTryResource super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaTTryResource >> javaTryResourceOwner [
	"Relation named: #javaTryResourceOwner type: #FASTJavaTryCatchStatement opposite: #resources"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The try-with-resource that owns me'>
	<container>
	^ javaTryResourceOwner
]

{ #category : 'accessing' }
FASTJavaTTryResource >> javaTryResourceOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaTryResourceOwner := anObject
]
