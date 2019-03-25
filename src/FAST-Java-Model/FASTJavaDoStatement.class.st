"
A node of a do-while statement.

eg.
do {
...
} while(...);
"
Class {
	#name : #FASTJavaDoStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaDoStatement class >> annotation [

	<MSEClass: #DoStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaDoStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaDoStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaDoStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaDoStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaDoStatement >> body [

	<generated>
	<MSEComment: 'A statement to be evaluated in the loop'>
	<MSEProperty: #body type: #Object>
	^ self privateState attributeAt: #body ifAbsentPut: [ FMMultivalueLink on: self opposite: #doBodyOwner: ]
]

{ #category : #accessing }
FASTJavaDoStatement >> body: anObject [

	<generated>
	self body value: anObject
]

{ #category : #navigation }
FASTJavaDoStatement >> bodyGroup [

	<generated>
	<navigation: 'Body'>
	^ MooseGroup
			withAll: (self body asSet)
]

{ #category : #accessing }
FASTJavaDoStatement >> condition [

	<generated>
	<MSEComment: 'The condition of the statement'>
	<MSEProperty: #condition type: #Object>
	^ self privateState attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaDoStatement >> condition: anObject [

	<generated>
	(self privateState attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #condition put: anObject.
	anObject doConditionOwner: self
]

{ #category : #navigation }
FASTJavaDoStatement >> conditionGroup [

	<generated>
	<navigation: 'Condition'>
	^ MooseGroup
			with: (self condition)
]
