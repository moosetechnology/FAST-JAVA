"
A string in Java
"
Class {
	#name : #FASTJavaStringLiteral,
	#superclass : #FASTStringLiteral,
	#instVars : [
		'#javaStringAssertStatementOwner => FMOne type: #FASTJavaAssertStatement opposite: #message'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaStringLiteral class >> annotation [

	<MSEClass: #StringLiteral super: #FASTStringLiteral>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaStringLiteral class >> requirements [

	<generated>
	^ { FASTJavaAssertStatement }
]

{ #category : #accessing }
FASTJavaStringLiteral >> javaStringAssertStatementOwner [
	"Relation named: #javaStringAssertStatementOwner type: #FASTJavaAssertStatement opposite: #message"

	<generated>
	<MSEComment: 'the assert that can raised me'>
	<container>
	^ javaStringAssertStatementOwner
]

{ #category : #accessing }
FASTJavaStringLiteral >> javaStringAssertStatementOwner: anObject [

	<generated>
	javaStringAssertStatementOwner := anObject

]

{ #category : #navigation }
FASTJavaStringLiteral >> javaStringAssertStatementOwnerGroup [
	<generated>
	<navigation: 'JavaStringAssertStatementOwner'>
	^ MooseGroup with: self javaStringAssertStatementOwner
]
