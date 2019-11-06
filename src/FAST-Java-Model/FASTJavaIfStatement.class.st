"
A node of a if statement or an if-else statement.

eg.
if(...) {
...
} else {
...
}
"
Class {
	#name : #FASTJavaIfStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaIfStatement class >> annotation [

	<FMClass: #IfStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaIfStatement >> condition [
	"Relation named: #condition type: #FASTExpression opposite: #ifConditionOwner"

	<generated>
	<FMComment: 'The condition of the statement'>
	<FMProperty: #condition type: #FASTExpression opposite: #ifConditionOwner>
	^ self privateState attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaIfStatement >> condition: anObject [

	<generated>
	(self privateState attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self privateState attributeAt: #condition put: anObject.
		otherSide ifConditionOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #condition put: anObject.
		anObject ifConditionOwner: self ]
]

{ #category : #navigation }
FASTJavaIfStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseGroup with: self condition
]

{ #category : #accessing }
FASTJavaIfStatement >> elsePart [
	"Relation named: #elsePart type: #FASTStatement opposite: #ifElsePartOwner"

	<generated>
	<FMComment: 'else part'>
	<FMProperty: #elsePart type: #FASTStatement opposite: #ifElsePartOwner>
	^ self privateState attributeAt: #elsePart ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaIfStatement >> elsePart: anObject [

	<generated>
	(self privateState attributeAt: #elsePart ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self elsePart.
		self privateState attributeAt: #elsePart put: anObject.
		otherSide ifElsePartOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #elsePart put: anObject.
		anObject ifElsePartOwner: self ]
]

{ #category : #navigation }
FASTJavaIfStatement >> elsePartGroup [
	<generated>
	<navigation: 'ElsePart'>
	^ MooseGroup with: self elsePart
]

{ #category : #accessing }
FASTJavaIfStatement >> thenPart [
	"Relation named: #thenPart type: #FASTStatement opposite: #ifThenPartOwner"

	<generated>
	<FMComment: 'then part'>
	<FMProperty: #thenPart type: #FASTStatement opposite: #ifThenPartOwner>
	^ self privateState attributeAt: #thenPart ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaIfStatement >> thenPart: anObject [

	<generated>
	(self privateState attributeAt: #thenPart ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self thenPart.
		self privateState attributeAt: #thenPart put: anObject.
		otherSide ifThenPartOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #thenPart put: anObject.
		anObject ifThenPartOwner: self ]
]

{ #category : #navigation }
FASTJavaIfStatement >> thenPartGroup [
	<generated>
	<navigation: 'ThenPart'>
	^ MooseGroup with: self thenPart
]
