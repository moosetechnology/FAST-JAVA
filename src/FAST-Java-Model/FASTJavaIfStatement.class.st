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
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaIfStatement class >> annotation [

	<FMClass: #IfStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaIfStatement >> condition [
	"Relation named: #condition type: #FASTTExpression opposite: #ifConditionOwner"

	<generated>
	<FMComment: 'The condition of the statement'>
	<FMProperty: #condition type: #FASTTExpression opposite: #ifConditionOwner>
	^ self attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaIfStatement >> condition: anObject [

	<generated>
	(self attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self attributeAt: #condition put: anObject.
		otherSide ifConditionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #condition put: anObject.
		anObject ifConditionOwner: self ]
]

{ #category : #navigation }
FASTJavaIfStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]

{ #category : #accessing }
FASTJavaIfStatement >> elsePart [
	"Relation named: #elsePart type: #FASTTStatement opposite: #ifElsePartOwner"

	<generated>
	<FMComment: 'else part'>
	<FMProperty: #elsePart type: #FASTTStatement opposite: #ifElsePartOwner>
	^ self attributeAt: #elsePart ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaIfStatement >> elsePart: anObject [

	<generated>
	(self attributeAt: #elsePart ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self elsePart.
		self attributeAt: #elsePart put: anObject.
		otherSide ifElsePartOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #elsePart put: anObject.
		anObject ifElsePartOwner: self ]
]

{ #category : #navigation }
FASTJavaIfStatement >> elsePartGroup [
	<generated>
	<navigation: 'ElsePart'>
	^ MooseSpecializedGroup with: self elsePart
]

{ #category : #accessing }
FASTJavaIfStatement >> thenPart [
	"Relation named: #thenPart type: #FASTTStatement opposite: #ifThenPartOwner"

	<generated>
	<FMComment: 'then part'>
	<FMProperty: #thenPart type: #FASTTStatement opposite: #ifThenPartOwner>
	^ self attributeAt: #thenPart ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaIfStatement >> thenPart: anObject [

	<generated>
	(self attributeAt: #thenPart ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self thenPart.
		self attributeAt: #thenPart put: anObject.
		otherSide ifThenPartOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #thenPart put: anObject.
		anObject ifThenPartOwner: self ]
]

{ #category : #navigation }
FASTJavaIfStatement >> thenPartGroup [
	<generated>
	<navigation: 'ThenPart'>
	^ MooseSpecializedGroup with: self thenPart
]
