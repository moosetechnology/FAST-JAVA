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

	<MSEClass: #AssertStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaAssertStatement >> condition [
	"Relation named: #condition type: #FASTJavaExpression opposite: #assertConditionOwner"

	<generated>
	<MSEComment: 'The condition of the statement'>
	<MSEProperty: #condition type: #Object>
	^ self privateState attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaAssertStatement >> condition: anObject [

	<generated>
	(self privateState attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self privateState attributeAt: #condition put: anObject.
		otherSide assertConditionOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #condition put: anObject.
		anObject assertConditionOwner: self ]
]

{ #category : #navigation }
FASTJavaAssertStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseGroup with: self condition
]

{ #category : #accessing }
FASTJavaAssertStatement >> message [
	"Relation named: #message type: #FASTJavaStringLiteral opposite: #javaStringAssertStatementOwner"

	<generated>
	<MSEComment: 'The error message that is raised in case the condition is false'>
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
	^ MooseGroup with: self message
]
