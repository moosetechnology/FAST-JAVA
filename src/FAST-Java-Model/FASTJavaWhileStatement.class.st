"
A node of a while statement.

eg.
while(...) {
...
}
"
Class {
	#name : #FASTJavaWhileStatement,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaWhileStatement class >> annotation [

	<FMClass: #WhileStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaWhileStatement >> body [
	"Relation named: #body type: #FASTTStatement opposite: #whileBodyOwner"

	<generated>
	<FMComment: 'A statement to be evaluated in the loop'>
	<FMProperty: #body type: #FASTTStatement opposite: #whileBodyOwner>
	^ self attributeAt: #body ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaWhileStatement >> body: anObject [

	<generated>
	(self attributeAt: #body ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self body.
		self attributeAt: #body put: anObject.
		otherSide whileBodyOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #body put: anObject.
		anObject whileBodyOwner: self ]
]

{ #category : #navigation }
FASTJavaWhileStatement >> bodyGroup [
	<generated>
	<navigation: 'Body'>
	^ MooseSpecializedGroup with: self body
]

{ #category : #accessing }
FASTJavaWhileStatement >> condition [
	"Relation named: #condition type: #FASTTExpression opposite: #whileConditionOwner"

	<generated>
	<FMComment: 'The condition of the statement'>
	<FMProperty: #condition type: #FASTTExpression opposite: #whileConditionOwner>
	^ self attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaWhileStatement >> condition: anObject [

	<generated>
	(self attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self attributeAt: #condition put: anObject.
		otherSide whileConditionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #condition put: anObject.
		anObject whileConditionOwner: self ]
]

{ #category : #navigation }
FASTJavaWhileStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]
