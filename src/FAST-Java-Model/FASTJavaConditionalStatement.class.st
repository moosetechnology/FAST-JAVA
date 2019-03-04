"
I represent a Java conditionnal Statement

ex:

(h.get() == 2) ? thenPart : elsePart
"
Class {
	#name : #FASTJavaConditionalStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaConditionalStatement class >> annotation [

	<MSEClass: #ConditionalStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaConditionalStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaConditionalStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaConditionalStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaConditionalStatement class >> requirements [

	<generated>
	^ {  }
]
