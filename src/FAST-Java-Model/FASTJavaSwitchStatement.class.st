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

{ #category : #generator }
FASTJavaSwitchStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaSwitchStatement class>>#generatedSlotNames'.
	^ #(cases)
]

{ #category : #generator }
FASTJavaSwitchStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaSwitchStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaSwitchStatement >> cases [

	<generated>
	<MSEComment: 'The cases of the switch statements'>
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
	^ MooseGroup
			withAll: (self cases asSet)
]
