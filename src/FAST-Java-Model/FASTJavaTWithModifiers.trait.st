"
I have modifiers
"
Trait {
	#name : #FASTJavaTWithModifiers,
	#instVars : [
		'#modifiers => FMMany type: #FASTJavaTModifier opposite: #javaModifierOwner'
	],
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #meta }
FASTJavaTWithModifiers classSide >> annotation [

	<FMClass: #TWithModifiers super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTJavaTWithModifiers >> addModifier: anObject [
	<generated>
	^ self modifiers add: anObject
]

{ #category : #accessing }
FASTJavaTWithModifiers >> modifiers [
	"Relation named: #modifiers type: #FASTJavaTModifier opposite: #javaModifierOwner"

	<generated>
	<FMComment: 'My modifiers'>
	<derived>
	^ modifiers
]

{ #category : #accessing }
FASTJavaTWithModifiers >> modifiers: anObject [

	<generated>
	modifiers value: anObject
]

{ #category : #navigation }
FASTJavaTWithModifiers >> modifiersGroup [
	<generated>
	<navigation: 'Modifiers'>
	^ MooseGroup withAll: self modifiers asSet
]
