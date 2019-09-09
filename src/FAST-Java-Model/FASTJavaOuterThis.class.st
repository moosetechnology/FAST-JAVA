"
I represent a java outer this (only a call to 'this' to a class
	
ex.:

hello(MyClass.this)
"
Class {
	#name : #FASTJavaOuterThis,
	#superclass : #FASTExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaOuterThis class >> annotation [

	<MSEClass: #OuterThis super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaOuterThis >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaOuterThisOwner"

	<generated>
	<MSEComment: 'The accessed type'>
	<MSEProperty: #type type: #Object>
	^ self privateState attributeAt: #type ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaOuterThis >> type: anObject [

	<generated>
	(self privateState attributeAt: #type ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self type.
		self privateState attributeAt: #type put: anObject.
		otherSide javaOuterThisOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #type put: anObject.
		anObject javaOuterThisOwner: self ]
]

{ #category : #navigation }
FASTJavaOuterThis >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseGroup with: self type
]
