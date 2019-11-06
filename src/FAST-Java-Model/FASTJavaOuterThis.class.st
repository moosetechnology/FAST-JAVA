"
I represent a java outer this (only a call to 'this' to a class
	
ex.:

hello(MyClass.this)
"
Class {
	#name : #FASTJavaOuterThis,
	#superclass : #FASTExpression,
	#instVars : [
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaOuterThisOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaOuterThis class >> annotation [

	<FMClass: #OuterThis super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaOuterThis >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaOuterThisOwner"

	<generated>
	<FMComment: 'The accessed type'>
	^ type
]

{ #category : #accessing }
FASTJavaOuterThis >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #navigation }
FASTJavaOuterThis >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseGroup with: self type
]
