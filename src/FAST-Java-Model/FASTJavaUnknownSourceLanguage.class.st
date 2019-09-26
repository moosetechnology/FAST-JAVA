Class {
	#name : #FASTJavaUnknownSourceLanguage,
	#superclass : #FASTJavaSourceLanguage,
	#traits : 'FamixTSourceLanguage + FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait + FamixTUnknownSourceLanguage classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaUnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FASTJavaSourceLanguage>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]
