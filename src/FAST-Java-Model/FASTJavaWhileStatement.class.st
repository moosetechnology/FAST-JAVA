"
A node of a while statement.

eg.
while(...) {
...
}
"
Class {
	#name : #FASTJavaWhileStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaWhileStatement class >> annotation [

	<MSEClass: #WhileStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaWhileStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaWhileStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaWhileStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaWhileStatement class >> requirements [

	<generated>
	^ {  }
]
