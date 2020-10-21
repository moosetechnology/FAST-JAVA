"
I represent an assert statement

example:

void method (){
	assert condition1 || condition2 : ""error message""
}

"
Class {
	#name : #FASTJavaAssertStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'#message => FMOne type: #FASTJavaStringLiteral opposite: #javaStringAssertStatementOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAssertStatement class >> annotation [

	<FMClass: #AssertStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaAssertStatement >> condition [
	"Relation named: #condition type: #FASTExpression opposite: #assertConditionOwner"

	<generated>
	<FMComment: 'The condition of the statement'>
	<FMProperty: #condition type: #FASTExpression opposite: #assertConditionOwner>
	^ self attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaAssertStatement >> condition: anObject [

	<generated>
	(self attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self attributeAt: #condition put: anObject.
		otherSide assertConditionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #condition put: anObject.
		anObject assertConditionOwner: self ]
]

{ #category : #navigation }
FASTJavaAssertStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]

{ #category : #accessing }
FASTJavaAssertStatement >> message [
	"Relation named: #message type: #FASTJavaStringLiteral opposite: #javaStringAssertStatementOwner"

	<generated>
	<FMComment: 'The error message that is raised in case the condition is false'>
	^ message
]

{ #category : #accessing }
FASTJavaAssertStatement >> message: anObject [

	<generated>
	message := anObject
]

{ #category : #navigation }
FASTJavaAssertStatement >> messageGroup [
	<generated>
	<navigation: 'Message'>
	^ MooseSpecializedGroup with: self message
]
