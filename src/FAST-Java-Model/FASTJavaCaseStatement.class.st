"
case part of switch statement
"
Class {
	#name : #FASTJavaCaseStatement,
	#superclass : #FASTStatementBlock,
	#instVars : [
		'#javaCaseStatementSwitchOwner => FMOne type: #FASTJavaSwitchStatement opposite: #cases'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaCaseStatement class >> annotation [

	<MSEClass: #CaseStatement super: #FASTStatementBlock>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaCaseStatement class >> requirements [

	<generated>
	^ { FASTJavaSwitchStatement }
]

{ #category : #accessing }
FASTJavaCaseStatement >> javaCaseStatementSwitchOwner [

	<generated>
	<MSEComment: 'javaSwitch owner'>
	<container>

	^ javaCaseStatementSwitchOwner
]

{ #category : #accessing }
FASTJavaCaseStatement >> javaCaseStatementSwitchOwner: anObject [

	<generated>
	javaCaseStatementSwitchOwner := anObject

]

{ #category : #navigation }
FASTJavaCaseStatement >> javaCaseStatementSwitchOwnerGroup [

	<generated>
	<navigation: 'JavaCaseStatementSwitchOwner'>
	^ MooseGroup
			with: (self javaCaseStatementSwitchOwner)
]
