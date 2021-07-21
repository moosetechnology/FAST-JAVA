"
I represent a Java conditionnal Statement

ex:

(h.get() == 2) ? thenPart : elsePart
"
Class {
	#name : #FASTJavaConditionalExpression,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTReceiver + FASTTExpression',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTTExpression classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaConditionalExpression class >> annotation [

	<FMClass: #ConditionalExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaConditionalExpression >> condition [
	"Relation named: #condition type: #FASTTExpression opposite: #conditionalConditionOwner"

	<generated>
	<FMComment: 'The condition of the statement'>
	<FMProperty: #condition type: #FASTTExpression opposite: #conditionalConditionOwner>
	^ self attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaConditionalExpression >> condition: anObject [

	<generated>
	(self attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self attributeAt: #condition put: anObject.
		otherSide conditionalConditionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #condition put: anObject.
		anObject conditionalConditionOwner: self ]
]

{ #category : #navigation }
FASTJavaConditionalExpression >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]

{ #category : #accessing }
FASTJavaConditionalExpression >> elsePart [
	"Relation named: #elsePart type: #FASTTExpression opposite: #conditionalElsePartOwner"

	<generated>
	<FMComment: 'else part'>
	<FMProperty: #elsePart type: #FASTTExpression opposite: #conditionalElsePartOwner>
	^ self attributeAt: #elsePart ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaConditionalExpression >> elsePart: anObject [

	<generated>
	(self attributeAt: #elsePart ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self elsePart.
		self attributeAt: #elsePart put: anObject.
		otherSide conditionalElsePartOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #elsePart put: anObject.
		anObject conditionalElsePartOwner: self ]
]

{ #category : #navigation }
FASTJavaConditionalExpression >> elsePartGroup [
	<generated>
	<navigation: 'ElsePart'>
	^ MooseSpecializedGroup with: self elsePart
]

{ #category : #accessing }
FASTJavaConditionalExpression >> thenPart [
	"Relation named: #thenPart type: #FASTTExpression opposite: #conditionalThenPartOwner"

	<generated>
	<FMComment: 'then part'>
	<FMProperty: #thenPart type: #FASTTExpression opposite: #conditionalThenPartOwner>
	^ self attributeAt: #thenPart ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaConditionalExpression >> thenPart: anObject [

	<generated>
	(self attributeAt: #thenPart ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self thenPart.
		self attributeAt: #thenPart put: anObject.
		otherSide conditionalThenPartOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #thenPart put: anObject.
		anObject conditionalThenPartOwner: self ]
]

{ #category : #navigation }
FASTJavaConditionalExpression >> thenPartGroup [
	<generated>
	<navigation: 'ThenPart'>
	^ MooseSpecializedGroup with: self thenPart
]
