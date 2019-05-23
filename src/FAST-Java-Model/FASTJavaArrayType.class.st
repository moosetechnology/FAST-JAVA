"
I represent a type of Array
"
Class {
	#name : #FASTJavaArrayType,
	#superclass : #FASTVariableExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaArrayType class >> annotation [

	<MSEClass: #ArrayType super: #FASTVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaArrayType class >> generatedSlotNames [
	<generated>
	'FASTJavaArrayType class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaArrayType class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaArrayType class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaArrayType >> baseType [

	<generated>
	<MSEComment: 'The type of the array'>
	<MSEProperty: #baseType type: #Object>
	^ self privateState attributeAt: #baseType ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaArrayType >> baseType: anObject [

	<generated>
	(self privateState attributeAt: #baseType ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #baseType put: anObject.
	anObject javaArrayTypeOwner: self
]

{ #category : #navigation }
FASTJavaArrayType >> baseTypeGroup [

	<generated>
	<navigation: 'BaseType'>
	^ MooseGroup
			with: (self baseType)
]
