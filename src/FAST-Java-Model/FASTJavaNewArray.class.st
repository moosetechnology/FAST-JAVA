"
I represent a java new array node.
ex.

new String()[""10px"", ""Hello world""]
"
Class {
	#name : #FASTJavaNewArray,
	#superclass : #FASTJavaNewExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaNewArray class >> annotation [

	<MSEClass: #NewArray super: #FASTJavaNewExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaNewArray class >> generatedSlotNames [
	<generated>
	'FASTJavaNewArray class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaNewArray class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaNewArray class >> requirements [

	<generated>
	^ {  }
]
