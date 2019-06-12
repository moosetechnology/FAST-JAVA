"
I represent a Java conditionnal Statement

ex:

(h.get() == 2) ? thenPart : elsePart
"
Class {
	#name : #FASTJavaConditionalExpression,
	#superclass : #FASTExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaConditionalExpression class >> annotation [

	<MSEClass: #ConditionalExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaConditionalExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaConditionalExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaConditionalExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaConditionalExpression class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaConditionalExpression >> condition [

	<generated>
	<MSEComment: 'The condition of the statement'>
	<MSEProperty: #condition type: #Object>
	^ self privateState attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaConditionalExpression >> condition: anObject [

	<generated>
	(self privateState attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self privateState attributeAt: #condition put: anObject.
		otherSide conditionalConditionOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #condition put: anObject.
		anObject conditionalConditionOwner: self ]
]

{ #category : #navigation }
FASTJavaConditionalExpression >> conditionGroup [

	<generated>
	<navigation: 'Condition'>
	^ MooseGroup
			with: (self condition)
]

{ #category : #accessing }
FASTJavaConditionalExpression >> elsePart [

	<generated>
	<MSEComment: 'else part'>
	<MSEProperty: #elsePart type: #Object>
	^ self privateState attributeAt: #elsePart ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaConditionalExpression >> elsePart: anObject [

	<generated>
	(self privateState attributeAt: #elsePart ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self elsePart.
		self privateState attributeAt: #elsePart put: anObject.
		otherSide conditionalElsePartOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #elsePart put: anObject.
		anObject conditionalElsePartOwner: self ]
]

{ #category : #navigation }
FASTJavaConditionalExpression >> elsePartGroup [

	<generated>
	<navigation: 'ElsePart'>
	^ MooseGroup
			with: (self elsePart)
]

{ #category : #accessing }
FASTJavaConditionalExpression >> thenPart [

	<generated>
	<MSEComment: 'then part'>
	<MSEProperty: #thenPart type: #Object>
	^ self privateState attributeAt: #thenPart ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaConditionalExpression >> thenPart: anObject [

	<generated>
	(self privateState attributeAt: #thenPart ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self thenPart.
		self privateState attributeAt: #thenPart put: anObject.
		otherSide conditionalThenPartOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #thenPart put: anObject.
		anObject conditionalThenPartOwner: self ]
]

{ #category : #navigation }
FASTJavaConditionalExpression >> thenPartGroup [

	<generated>
	<navigation: 'ThenPart'>
	^ MooseGroup
			with: (self thenPart)
]
