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

	<FMClass: #CaseStatement super: #FASTStatementBlock>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaCaseStatement >> javaCaseStatementSwitchOwner [
	"Relation named: #javaCaseStatementSwitchOwner type: #FASTJavaSwitchStatement opposite: #cases"

	<generated>
	<FMComment: 'javaSwitch owner'>
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
	^ MooseSpecializedGroup with: self javaCaseStatementSwitchOwner
]
