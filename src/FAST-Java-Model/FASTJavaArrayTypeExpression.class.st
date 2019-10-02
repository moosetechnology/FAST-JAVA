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

{ #category : #accessing }
FASTJavaArrayTypeExpression >> baseType [
	"Relation named: #baseType type: #FASTExpression opposite: #javaArrayTypeNameOwner"

	<generated>
	<MSEComment: 'The type of the array'>
	<MSEProperty: #baseType type: #FASTExpression opposite: #javaArrayTypeNameOwner>
	^ self privateState attributeAt: #baseType ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaArrayTypeExpression >> baseType: anObject [

	<generated>
	(self privateState attributeAt: #baseType ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self baseType.
		self privateState attributeAt: #baseType put: anObject.
		otherSide javaArrayTypeNameOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #baseType put: anObject.
		anObject javaArrayTypeNameOwner: self ]
]

{ #category : #navigation }
FASTJavaArrayTypeExpression >> baseTypeGroup [
	<generated>
	<navigation: 'BaseType'>
	^ MooseGroup with: self baseType
]
