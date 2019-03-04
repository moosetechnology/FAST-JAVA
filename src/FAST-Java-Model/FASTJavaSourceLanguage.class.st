Class {
	#name : #FASTJavaSourceLanguage,
	#superclass : #FASTJavaEntity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSourceLanguage class >> annotation [

	<MSEClass: #SourceLanguage super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaSourceLanguage class >> generatedSlotNames [
	<generated>
	'FASTJavaSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaSourceLanguage class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceLanguage)
]

{ #category : #meta }
FASTJavaSourceLanguage class >> requirements [

	<generated>
	^ {  }
]
