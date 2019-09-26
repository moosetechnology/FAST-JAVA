"
A node representing switch stetement

eg.
switch (_) {
...
}
"
Class {
	#name : #FASTJavaSwitchStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'#cases => FMMany type: #FASTJavaCaseStatement opposite: #javaCaseStatementSwitchOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSwitchStatement class >> annotation [

	<MSEClass: #SwitchStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTJavaSwitchStatement >> addCases: anObject [
	<generated>
	^ self cases add: anObject
]

{ #category : #accessing }
FASTJavaSwitchStatement >> cases [
	"Relation named: #cases type: #FASTJavaCaseStatement opposite: #javaCaseStatementSwitchOwner"

	<generated>
	<MSEComment: 'The cases of the switch statements'>
	<derived>
	^ cases
]

{ #category : #accessing }
FASTJavaSwitchStatement >> cases: anObject [

	<generated>
	cases value: anObject

]

{ #category : #navigation }
FASTJavaSwitchStatement >> casesGroup [
	<generated>
	<navigation: 'Cases'>
	^ MooseGroup withAll: self cases asSet
]
