"
A node representing switch stetement

eg.
switch (_) {
...
}
"
Class {
	#name : #FASTJavaSwitchStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSwitchStatement class >> annotation [

	<MSEClass: #SwitchStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaSwitchStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaSwitchStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaSwitchStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaSwitchStatement class >> requirements [

	<generated>
	^ {  }
]
