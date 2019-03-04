"
I represent the 'catch' part of the TryCatch Statement
"
Class {
	#name : #FASTJavaCatchPartStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'body'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaCatchPartStatement class >> annotation [

	<MSEClass: #CatchPartStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaCatchPartStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaCatchPartStatement class>>#generatedSlotNames'.
	^ #(body)
]

{ #category : #generator }
FASTJavaCatchPartStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaCatchPartStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> body [

	<MSEProperty: #body type: #FASTStatement>
	<generated>
	<MSEComment: 'The body of the Catch part statement'>
	^ body
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> body: anObject [

	<generated>
	body := anObject

]
