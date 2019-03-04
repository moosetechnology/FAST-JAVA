"
A node of a do-while statement.

eg.
do {
...
} while(...);
"
Class {
	#name : #FASTJavaDoStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaDoStatement class >> annotation [

	<MSEClass: #DoStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaDoStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaDoStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaDoStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaDoStatement class >> requirements [

	<generated>
	^ {  }
]
