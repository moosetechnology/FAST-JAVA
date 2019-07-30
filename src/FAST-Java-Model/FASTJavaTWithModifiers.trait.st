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

	<MSEClass: #TWithModifiers super: #Trait>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTJavaTWithModifiers >> addModifiers: anObject [
			
	<generated>
	^ self modifiers add: anObject
]

{ #category : #accessing }
FASTJavaTWithModifiers >> modifiers [

	<generated>
	<MSEComment: 'My modifiers'>
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
	^ MooseGroup
			withAll: (self modifiers asSet)
]
