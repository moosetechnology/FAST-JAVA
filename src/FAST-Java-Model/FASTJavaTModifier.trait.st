"
I am a modifier in java
example:

public, proctected, private

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `javaModifierOwner` | `FASTJavaTModifier` | `modifiers` | `FASTJavaTWithModifiers` | The owner of the modifier|



"
Trait {
	#name : #FASTJavaTModifier,
	#instVars : [
		'#javaModifierOwner => FMOne type: #FASTJavaTWithModifiers opposite: #modifiers'
	],
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #meta }
FASTJavaTModifier classSide >> annotation [

	<FMClass: #TModifier super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaTModifier >> javaModifierOwner [
	"Relation named: #javaModifierOwner type: #FASTJavaTWithModifiers opposite: #modifiers"

	<generated>
	<FMComment: 'The owner of the modifier'>
	<container>
	^ javaModifierOwner
]

{ #category : #accessing }
FASTJavaTModifier >> javaModifierOwner: anObject [

	<generated>
	javaModifierOwner := anObject
]

{ #category : #navigation }
FASTJavaTModifier >> javaModifierOwnerGroup [
	<generated>
	<navigation: 'JavaModifierOwner'>
	^ MooseSpecializedGroup with: self javaModifierOwner
]
