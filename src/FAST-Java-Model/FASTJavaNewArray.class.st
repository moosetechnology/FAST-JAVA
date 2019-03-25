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

{ #category : #accessing }
FASTJavaNewArray >> initializers [

	<generated>
	<MSEComment: 'The initial values of the array'>
	<MSEProperty: #initializers type: #Object>
	^ self privateState attributeAt: #initializers ifAbsentPut: [ FMMultivalueLink on: self opposite: #javaNewArrayInitialOwner: ]
]

{ #category : #accessing }
FASTJavaNewArray >> initializers: anObject [

	<generated>
	self initializers value: anObject
]

{ #category : #navigation }
FASTJavaNewArray >> initializersGroup [

	<generated>
	<navigation: 'Initializers'>
	^ MooseGroup
			withAll: (self initializers asSet)
]
