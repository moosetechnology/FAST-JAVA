"
I represent the 'catch' part of the TryCatch Statement
"
Class {
	#name : #FASTJavaCatchPartStatement,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#tryOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #catches',
		'#body => FMOne type: #FASTJavaStatementBlock opposite: #javaCatchPartStatementOwner',
		'#catchedTypes => FMMany type: #FASTJavaTypeExpression opposite: #catchOwner',
		'#parameter => FMOne type: #FASTJavaVariableExpression opposite: #javaCatchParameterOwnler'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaCatchPartStatement class >> annotation [

	<FMClass: #CatchPartStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTJavaCatchPartStatement >> addCatchedType: anObject [
	<generated>
	^ self catchedTypes add: anObject
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> body [
	"Relation named: #body type: #FASTJavaStatementBlock opposite: #javaCatchPartStatementOwner"

	<generated>
	<FMComment: 'The body of the catch part'>
	^ body
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> body: anObject [

	<generated>
	body := anObject
]

{ #category : #navigation }
FASTJavaCatchPartStatement >> bodyGroup [
	<generated>
	<navigation: 'Body'>
	^ MooseSpecializedGroup with: self body
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> catchedTypes [
	"Relation named: #catchedTypes type: #FASTJavaTypeExpression opposite: #catchOwner"

	<generated>
	<FMComment: 'The types (exception) that are catched'>
	<derived>
	^ catchedTypes
]

{ #category : #accessing }
FASTJavaCatchPartStatement >> catchedTypes: anObject [

	<generated>
	catchedTypes value: anObject
]

{ #category : #navigation }
FASTJavaCatchPartStatement >> catchedTypesGroup [
	<generated>
	<navigation: 'CatchedTypes'>
	^ MooseSpecializedGroup withAll: self catchedTypes asSet
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
	<FMComment: 'The try part that owns me'>
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
