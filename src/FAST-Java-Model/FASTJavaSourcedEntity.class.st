Class {
	#name : #FASTJavaSourcedEntity,
	#superclass : #FASTJavaEntity,
	#traits : 'FamixTWithComments + FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithComments classTrait + FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaSourcedEntity class >> generatedSlotNames [
	<generated>
	'FASTJavaSourcedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaSourcedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithComments FamixTWithSourceAnchor FamixTWithSourceLanguage)
]

{ #category : #meta }
FASTJavaSourcedEntity class >> requirements [

	<generated>
	^ {  }
]
