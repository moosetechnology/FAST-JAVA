"
I represent an array type
"
Class {
	#name : #FASTJavaArrayTypeExpression,
	#superclass : #FASTJavaTypeExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaArrayTypeExpression class >> annotation [

	<MSEClass: #ArrayTypeExpression super: #FASTJavaTypeExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaArrayTypeExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaArrayTypeExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaArrayTypeExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaArrayTypeExpression class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaArrayTypeExpression >> baseType [

	<generated>
	<MSEComment: 'The type of the array'>
	<MSEProperty: #baseType type: #Object>
	^ self privateState attributeAt: #baseType ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaArrayTypeExpression >> baseType: anObject [

	<generated>
	(self privateState attributeAt: #baseType ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #baseType put: anObject.
	anObject javaArrayTypeOwner: self
]

{ #category : #navigation }
FASTJavaArrayTypeExpression >> baseTypeGroup [

	<generated>
	<navigation: 'BaseType'>
	^ MooseGroup
			with: (self baseType)
]
