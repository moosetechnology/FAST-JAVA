"
I hold the keyword modifiers I write, such as `public`, `static` or `final` (JLS 8.1.1).

The annotations written in the same list are held by TWithAnnotations, which every
construct that uses me also uses.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaModifier` | The keywords I write|



"
Trait {
	#name : 'FASTJavaTWithModifiers',
	#instVars : [
		'#modifiers => FMMany type: #FASTJavaModifier opposite: #javaModifierOwner'
	],
	#category : 'FAST-Java-Model-Traits',
	#package : 'FAST-Java-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTJavaTWithModifiers classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithModifiers super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaTWithModifiers >> addModifier: anObject [

	<ignoreForCoverage>
	<generated>
	^ self modifiers add: anObject
]

{ #category : 'accessing' }
FASTJavaTWithModifiers >> modifiers [
	"Relation named: #modifiers type: #FASTJavaModifier opposite: #javaModifierOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The keywords I write'>
	<derived>
	^ modifiers
]

{ #category : 'accessing' }
FASTJavaTWithModifiers >> modifiers: anObject [

	<ignoreForCoverage>
	<generated>
	modifiers value: anObject
]
