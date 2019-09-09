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

{ #category : #accessing }
FASTJavaNewArray >> initializer [
	"Relation named: #initializer type: #FASTJavaExpression opposite: #javaNewArrayInitialOwner"

	<generated>
	<MSEComment: 'The initializer of the array'>
	<MSEProperty: #initializer type: #Object>
	^ self privateState attributeAt: #initializer ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaNewArray >> initializer: anObject [

	<generated>
	(self privateState attributeAt: #initializer ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self initializer.
		self privateState attributeAt: #initializer put: anObject.
		otherSide javaNewArrayInitialOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #initializer put: anObject.
		anObject javaNewArrayInitialOwner: self ]
]

{ #category : #navigation }
FASTJavaNewArray >> initializerGroup [
	<generated>
	<navigation: 'Initializer'>
	^ MooseGroup with: self initializer
]
