"
A node of a for loop statement.

eg.
for(_;_;_) {
...
}
"
Class {
	#name : #FASTJavaForStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaForStatement class >> annotation [

	<MSEClass: #ForStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaForStatement >> body [
	"Relation named: #body type: #FASTStatement opposite: #forBodyOwner"

	<generated>
	<MSEComment: 'A statement to be evaluated in the loop'>
	<MSEProperty: #body type: #FASTStatement opposite: #forBodyOwner>
	^ self privateState attributeAt: #body ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForStatement >> body: anObject [

	<generated>
	(self privateState attributeAt: #body ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self body.
		self privateState attributeAt: #body put: anObject.
		otherSide forBodyOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #body put: anObject.
		anObject forBodyOwner: self ]
]

{ #category : #navigation }
FASTJavaForStatement >> bodyGroup [
	<generated>
	<navigation: 'Body'>
	^ MooseGroup with: self body
]

{ #category : #accessing }
FASTJavaForStatement >> condition [
	"Relation named: #condition type: #FASTExpression opposite: #forConditionOwner"

	<generated>
	<MSEComment: 'The condition of the statement'>
	<MSEProperty: #condition type: #FASTExpression opposite: #forConditionOwner>
	^ self privateState attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForStatement >> condition: anObject [

	<generated>
	(self privateState attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self privateState attributeAt: #condition put: anObject.
		otherSide forConditionOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #condition put: anObject.
		anObject forConditionOwner: self ]
]

{ #category : #navigation }
FASTJavaForStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseGroup with: self condition
]

{ #category : #accessing }
FASTJavaForStatement >> incrementor [
	"Relation named: #incrementor type: #FASTStatement opposite: #forIncrementorOwner"

	<generated>
	<MSEComment: 'Expression evaluated at the end of each loop'>
	<MSEProperty: #incrementor type: #FASTStatement opposite: #forIncrementorOwner>
	^ self privateState attributeAt: #incrementor ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForStatement >> incrementor: anObject [

	<generated>
	(self privateState attributeAt: #incrementor ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self incrementor.
		self privateState attributeAt: #incrementor put: anObject.
		otherSide forIncrementorOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #incrementor put: anObject.
		anObject forIncrementorOwner: self ]
]

{ #category : #navigation }
FASTJavaForStatement >> incrementorGroup [
	<generated>
	<navigation: 'Incrementor'>
	^ MooseGroup with: self incrementor
]

{ #category : #accessing }
FASTJavaForStatement >> initializer [
	"Relation named: #initializer type: #FASTStatement opposite: #forIninitializerOwner"

	<generated>
	<MSEComment: 'Expression used at initialization phase of a for loop'>
	<MSEProperty: #initializer type: #FASTStatement opposite: #forIninitializerOwner>
	^ self privateState attributeAt: #initializer ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForStatement >> initializer: anObject [

	<generated>
	(self privateState attributeAt: #initializer ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self initializer.
		self privateState attributeAt: #initializer put: anObject.
		otherSide forIninitializerOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #initializer put: anObject.
		anObject forIninitializerOwner: self ]
]

{ #category : #navigation }
FASTJavaForStatement >> initializerGroup [
	<generated>
	<navigation: 'Initializer'>
	^ MooseGroup with: self initializer
]
