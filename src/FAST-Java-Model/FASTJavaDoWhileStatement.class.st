"
A node of a do-while statement.

eg.
do {
...
} while(...);
"
Class {
	#name : #FASTJavaDoWhileStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaDoWhileStatement class >> annotation [

	<MSEClass: #DoWhileStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaDoWhileStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaDoWhileStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaDoWhileStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaDoWhileStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaDoWhileStatement >> body [

	<generated>
	<MSEComment: 'A statement to be evaluated in the loop'>
	<MSEProperty: #body type: #Object>
	^ self privateState attributeAt: #body ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaDoWhileStatement >> body: anObject [

	<generated>
	(self privateState attributeAt: #body ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self body.
		self privateState attributeAt: #body put: anObject.
		otherSide doBodyOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #body put: anObject.
		anObject doBodyOwner: self ]
]

{ #category : #navigation }
FASTJavaDoWhileStatement >> bodyGroup [

	<generated>
	<navigation: 'Body'>
	^ MooseGroup
			with: (self body)
]

{ #category : #accessing }
FASTJavaDoWhileStatement >> condition [

	<generated>
	<MSEComment: 'The condition of the statement'>
	<MSEProperty: #condition type: #Object>
	^ self privateState attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaDoWhileStatement >> condition: anObject [

	<generated>
	(self privateState attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self privateState attributeAt: #condition put: anObject.
		otherSide doConditionOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #condition put: anObject.
		anObject doConditionOwner: self ]
]

{ #category : #navigation }
FASTJavaDoWhileStatement >> conditionGroup [

	<generated>
	<navigation: 'Condition'>
	^ MooseGroup
			with: (self condition)
]
