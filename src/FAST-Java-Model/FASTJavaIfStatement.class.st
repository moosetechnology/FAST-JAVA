"
A node of a if statement or an if-else statement.

eg.
if(...) {
...
} else {
...
}
"
Class {
	#name : #FASTJavaIfStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaIfStatement class >> annotation [

	<MSEClass: #IfStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaIfStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaIfStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaIfStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaIfStatement class >> requirements [

	<generated>
	^ {  }
]
