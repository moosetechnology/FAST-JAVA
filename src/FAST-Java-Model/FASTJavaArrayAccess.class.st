"
I represent a java array access
	
ex:

liste[i]
"
Class {
	#name : #FASTJavaArrayAccess,
	#superclass : #FASTExpression,
	#traits : 'FASTJavaTAssigneable',
	#classTraits : 'FASTJavaTAssigneable classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaArrayAccess class >> annotation [

	<FMClass: #ArrayAccess super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaArrayAccess >> array [
	"Relation named: #array type: #FASTExpression opposite: #javaArrayArrayAccessOwner"

	<generated>
	<FMComment: 'Name of accessed field'>
	<FMProperty: #array type: #FASTExpression opposite: #javaArrayArrayAccessOwner>
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
	^ MooseGroup with: self array
]

{ #category : #accessing }
FASTJavaArrayAccess >> expression [
	"Relation named: #expression type: #FASTExpression opposite: #javaArrayAccessOwner"

	<generated>
	<FMComment: 'The accessed index'>
	<FMProperty: #expression type: #FASTExpression opposite: #javaArrayAccessOwner>
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
	^ MooseGroup with: self expression
]
