"
I represent the invocation of a Class constructor with the keyword 'new'

ex.

new Patate()
"
Class {
	#name : #FASTJavaNewExpression,
	#superclass : #FASTExpression,
	#traits : 'FASTTWithArguments',
	#classTraits : 'FASTTWithArguments classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaNewExpression class >> annotation [

	<MSEClass: #NewExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaNewExpression >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaNewExpressionOwner"

	<generated>
	<MSEComment: 'The type of the array'>
	<MSEProperty: #type type: #Object>
	<package: #'Carrefour-Model'>
	^ self privateState attributeAt: #type ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaNewExpression >> type: anObject [

	<generated>
	(self privateState attributeAt: #type ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self type.
		self privateState attributeAt: #type put: anObject.
		otherSide javaNewExpressionOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #type put: anObject.
		anObject javaNewExpressionOwner: self ]
]

{ #category : #navigation }
FASTJavaNewExpression >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseGroup with: self type
]
