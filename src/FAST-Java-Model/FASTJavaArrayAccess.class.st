"
I represent a java array access
	
ex:

liste[i]
"
Class {
	#name : #FASTJavaArrayAccess,
	#superclass : #FASTExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaArrayAccess class >> annotation [

	<MSEClass: #ArrayAccess super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaArrayAccess class >> generatedSlotNames [
	<generated>
	'FASTJavaArrayAccess class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaArrayAccess class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaArrayAccess class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaArrayAccess >> array [

	<generated>
	<MSEComment: 'Name of accessed field'>
	<MSEProperty: #array type: #Object>
	^ self privateState attributeAt: #array ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaArrayAccess >> array: anObject [

	<generated>
	(self privateState attributeAt: #array ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self array.
		self privateState attributeAt: #array put: anObject.
		otherSide javaArrayArrayAccessOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #array put: anObject.
		anObject javaArrayArrayAccessOwner: self ]
]

{ #category : #navigation }
FASTJavaArrayAccess >> arrayGroup [

	<generated>
	<navigation: 'Array'>
	^ MooseGroup
			with: (self array)
]

{ #category : #accessing }
FASTJavaArrayAccess >> expression [

	<generated>
	<MSEComment: 'The accessed index'>
	<MSEProperty: #expression type: #Object>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaArrayAccess >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self privateState attributeAt: #expression put: anObject.
		otherSide javaArrayAccessOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #expression put: anObject.
		anObject javaArrayAccessOwner: self ]
]

{ #category : #navigation }
FASTJavaArrayAccess >> expressionGroup [

	<generated>
	<navigation: 'Expression'>
	^ MooseGroup
			with: (self expression)
]
