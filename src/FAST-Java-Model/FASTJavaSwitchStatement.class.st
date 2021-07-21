"
A node representing switch stetement

eg.
switch (_) {
...
}
"
Class {
	#name : #FASTJavaSwitchStatement,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#cases => FMMany type: #FASTJavaCaseStatement opposite: #javaCaseStatementSwitchOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSwitchStatement class >> annotation [

	<FMClass: #SwitchStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTJavaSwitchStatement >> addCase: anObject [
	<generated>
	^ self cases add: anObject
]

{ #category : #accessing }
FASTJavaSwitchStatement >> cases [
	"Relation named: #cases type: #FASTJavaCaseStatement opposite: #javaCaseStatementSwitchOwner"

	<generated>
	<FMComment: 'The cases of the switch statements'>
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
	^ MooseSpecializedGroup withAll: self cases asSet
]
