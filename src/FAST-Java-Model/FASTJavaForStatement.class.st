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

	<FMClass: #ForStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaForStatement >> body [
	"Relation named: #body type: #FASTStatement opposite: #forBodyOwner"

	<generated>
	<FMComment: 'A statement to be evaluated in the loop'>
	<FMProperty: #body type: #FASTStatement opposite: #forBodyOwner>
	^ self attributeAt: #body ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForStatement >> body: anObject [

	<generated>
	(self attributeAt: #body ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self body.
		self attributeAt: #body put: anObject.
		otherSide forBodyOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #body put: anObject.
		anObject forBodyOwner: self ]
]

{ #category : #navigation }
FASTJavaForStatement >> bodyGroup [
	<generated>
	<navigation: 'Body'>
	^ MooseSpecializedGroup with: self body
]

{ #category : #accessing }
FASTJavaForStatement >> condition [
	"Relation named: #condition type: #FASTExpression opposite: #forConditionOwner"

	<generated>
	<FMComment: 'The condition of the statement'>
	<FMProperty: #condition type: #FASTExpression opposite: #forConditionOwner>
	^ self attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForStatement >> condition: anObject [

	<generated>
	(self attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self attributeAt: #condition put: anObject.
		otherSide forConditionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #condition put: anObject.
		anObject forConditionOwner: self ]
]

{ #category : #navigation }
FASTJavaForStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]

{ #category : #accessing }
FASTJavaForStatement >> incrementor [
	"Relation named: #incrementor type: #FASTStatement opposite: #forIncrementorOwner"

	<generated>
	<FMComment: 'Expression evaluated at the end of each loop'>
	<FMProperty: #incrementor type: #FASTStatement opposite: #forIncrementorOwner>
	^ self attributeAt: #incrementor ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForStatement >> incrementor: anObject [

	<generated>
	(self attributeAt: #incrementor ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self incrementor.
		self attributeAt: #incrementor put: anObject.
		otherSide forIncrementorOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #incrementor put: anObject.
		anObject forIncrementorOwner: self ]
]

{ #category : #navigation }
FASTJavaForStatement >> incrementorGroup [
	<generated>
	<navigation: 'Incrementor'>
	^ MooseSpecializedGroup with: self incrementor
]

{ #category : #accessing }
FASTJavaForStatement >> initializer [
	"Relation named: #initializer type: #FASTStatement opposite: #forIninitializerOwner"

	<generated>
	<FMComment: 'Expression used at initialization phase of a for loop'>
	<FMProperty: #initializer type: #FASTStatement opposite: #forIninitializerOwner>
	^ self attributeAt: #initializer ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForStatement >> initializer: anObject [

	<generated>
	(self attributeAt: #initializer ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self initializer.
		self attributeAt: #initializer put: anObject.
		otherSide forIninitializerOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #initializer put: anObject.
		anObject forIninitializerOwner: self ]
]

{ #category : #navigation }
FASTJavaForStatement >> initializerGroup [
	<generated>
	<navigation: 'Initializer'>
	^ MooseSpecializedGroup with: self initializer
]
