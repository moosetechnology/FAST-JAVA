"
I represent the 'catch' part of the TryCatch Statement
"
Class {
	#name : #FASTJavaCatchPartStatement,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#parameter => FMOne type: #FASTJavaVariableExpression opposite: #javaCatchParameterOwnler',
		'#tryOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #catches'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaCatchPartStatement class >> annotation [

	<FMClass: #CatchPartStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> body [
	"Relation named: #body type: #FASTTStatement opposite: #javaCatchPartStatementOwner"

	<generated>
	<FMComment: 'The body of the Catch part statement'>
	<FMProperty: #body type: #FASTTStatement opposite: #javaCatchPartStatementOwner>
	^ self attributeAt: #body ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> body: anObject [

	<generated>
	(self attributeAt: #body ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self body.
		self attributeAt: #body put: anObject.
		otherSide javaCatchPartStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #body put: anObject.
		anObject javaCatchPartStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaCatchPartStatement >> bodyGroup [
	<generated>
	<navigation: 'Body'>
	^ MooseSpecializedGroup with: self body
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> parameter [
	"Relation named: #parameter type: #FASTJavaVariableExpression opposite: #javaCatchParameterOwnler"

	<generated>
	<FMComment: 'The parameter of the catch part'>
	^ parameter
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> parameter: anObject [

	<generated>
	parameter := anObject
]

{ #category : #navigation }
FASTJavaCatchPartStatement >> parameterGroup [
	<generated>
	<navigation: 'Parameter'>
	^ MooseSpecializedGroup with: self parameter
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> tryOwner [
	"Relation named: #tryOwner type: #FASTJavaTryCatchStatement opposite: #catches"

	<generated>
	<FMComment: 'The try owner'>
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
	^ MooseSpecializedGroup with: self tryOwner
]
