"
A string in Java
"
Class {
	#name : #FASTJavaStringLiteral,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTReceiver + FASTTStringLiteral',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTTStringLiteral classTrait',
	#instVars : [
		'#javaStringAssertStatementOwner => FMOne type: #FASTJavaAssertStatement opposite: #message'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaStringLiteral class >> annotation [

	<FMClass: #StringLiteral super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaStringLiteral >> javaStringAssertStatementOwner [
	"Relation named: #javaStringAssertStatementOwner type: #FASTJavaAssertStatement opposite: #message"

	<generated>
	<FMComment: 'the assert that can raised me'>
	<container>
	<derived>
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
	^ MooseSpecializedGroup with: self javaStringAssertStatementOwner
]
