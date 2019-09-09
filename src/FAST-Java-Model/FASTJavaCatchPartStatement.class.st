"
I represent the 'catch' part of the TryCatch Statement
"
Class {
	#name : #FASTJavaCatchPartStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'#tryOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #catches'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaCatchPartStatement class >> annotation [

	<MSEClass: #CatchPartStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaCatchPartStatement class >> requirements [

	<generated>
	^ { FASTJavaTryCatchStatement }
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> body [
	"Relation named: #body type: #FASTJavaStatement opposite: #javaCatchPartStatementOwner"

	<generated>
	<MSEComment: 'The body of the Catch part statement'>
	<MSEProperty: #body type: #Object>
	^ self privateState attributeAt: #body ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> body: anObject [

	<generated>
	(self privateState attributeAt: #body ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self body.
		self privateState attributeAt: #body put: anObject.
		otherSide javaCatchPartStatementOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #body put: anObject.
		anObject javaCatchPartStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaCatchPartStatement >> bodyGroup [
	<generated>
	<navigation: 'Body'>
	^ MooseGroup with: self body
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> parameter [
	"Relation named: #parameter type: #FASTJavaVariableExpression opposite: #javaCatchParameterOwnler"

	<generated>
	<MSEComment: 'The parameter of the catch part'>
	<MSEProperty: #parameter type: #Object>
	^ self privateState attributeAt: #parameter ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> parameter: anObject [

	<generated>
	(self privateState attributeAt: #parameter ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parameter.
		self privateState attributeAt: #parameter put: anObject.
		otherSide javaCatchParameterOwnler: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #parameter put: anObject.
		anObject javaCatchParameterOwnler: self ]
]

{ #category : #navigation }
FASTJavaCatchPartStatement >> parameterGroup [
	<generated>
	<navigation: 'Parameter'>
	^ MooseGroup with: self parameter
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> tryOwner [
	"Relation named: #tryOwner type: #FASTJavaTryCatchStatement opposite: #catches"

	<generated>
	<MSEComment: 'The try owner'>
	<container>
	^ tryOwner
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> tryOwner: anObject [

	<generated>
	tryOwner := anObject

]

{ #category : #navigation }
FASTJavaCatchPartStatement >> tryOwnerGroup [
	<generated>
	<navigation: 'TryOwner'>
	^ MooseGroup with: self tryOwner
]
