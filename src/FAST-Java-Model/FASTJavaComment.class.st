Class {
	#name : #FASTJavaComment,
	#superclass : #FASTJavaSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaComment class >> annotation [

	<MSEClass: #Comment super: #FASTJavaSourcedEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaComment class >> generatedSlotNames [
	<generated>
	'FASTJavaComment class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaComment class >> generatedTraitNames [
	<generated>
	^ #(FamixTComment)
]

{ #category : #meta }
FASTJavaComment class >> requirements [

	<generated>
	^ {  }
]
