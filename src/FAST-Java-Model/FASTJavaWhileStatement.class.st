"
A node of a while statement.

eg.
while(...) {
...
}
"
Class {
	#name : #FASTJavaWhileStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaWhileStatement class >> annotation [

	<MSEClass: #WhileStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaWhileStatement >> body [

	<generated>
	<MSEComment: 'A statement to be evaluated in the loop'>
	<MSEProperty: #body type: #Object>
	^ self privateState attributeAt: #body ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaWhileStatement >> body: anObject [

	<generated>
	(self privateState attributeAt: #body ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self body.
		self privateState attributeAt: #body put: anObject.
		otherSide whileBodyOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #body put: anObject.
		anObject whileBodyOwner: self ]
]

{ #category : #navigation }
FASTJavaWhileStatement >> bodyGroup [

	<generated>
	<navigation: 'Body'>
	^ MooseGroup
			with: (self body)
]

{ #category : #accessing }
FASTJavaWhileStatement >> condition [

	<generated>
	<MSEComment: 'The condition of the statement'>
	<MSEProperty: #condition type: #Object>
	^ self privateState attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaWhileStatement >> condition: anObject [

	<generated>
	(self privateState attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self privateState attributeAt: #condition put: anObject.
		otherSide whileConditionOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #condition put: anObject.
		anObject whileConditionOwner: self ]
]

{ #category : #navigation }
FASTJavaWhileStatement >> conditionGroup [

	<generated>
	<navigation: 'Condition'>
	^ MooseGroup
			with: (self condition)
]
