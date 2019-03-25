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

{ #category : #generator }
FASTJavaWhileStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaWhileStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaWhileStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaWhileStatement class >> requirements [

	<generated>
	^ {  }
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
	self privateState attributeAt: #body put: anObject.
	anObject whileBodyOwner: self
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
	self privateState attributeAt: #condition put: anObject.
	anObject whileConditionOwner: self
]

{ #category : #navigation }
FASTJavaWhileStatement >> conditionGroup [

	<generated>
	<navigation: 'Condition'>
	^ MooseGroup
			with: (self condition)
]
