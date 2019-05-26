"
I represent a class type
"
Class {
	#name : #FASTJavaClassTypeExpression,
	#superclass : #FASTJavaTypeExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaClassTypeExpression class >> annotation [

	<MSEClass: #ClassTypeExpression super: #FASTJavaTypeExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaClassTypeExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaClassTypeExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaClassTypeExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaClassTypeExpression class >> requirements [

	<generated>
	^ {  }
]
