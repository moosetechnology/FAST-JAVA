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

	<FMClass: #ArrayTypeExpression super: #FASTJavaTypeExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaArrayTypeExpression >> baseType [
	"Relation named: #baseType type: #FASTTExpression opposite: #javaArrayTypeNameOwner"

	<generated>
	<FMComment: 'The type of the array'>
	<FMProperty: #baseType type: #FASTTExpression opposite: #javaArrayTypeNameOwner>
	^ self attributeAt: #baseType ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaArrayTypeExpression >> baseType: anObject [

	<generated>
	(self attributeAt: #baseType ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self baseType.
		self attributeAt: #baseType put: anObject.
		otherSide javaArrayTypeNameOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #baseType put: anObject.
		anObject javaArrayTypeNameOwner: self ]
]

{ #category : #navigation }
FASTJavaArrayTypeExpression >> baseTypeGroup [
	<generated>
	<navigation: 'BaseType'>
	^ MooseSpecializedGroup with: self baseType
]
