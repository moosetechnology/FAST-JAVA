"
I represent the invocation of a Class constructor with the keyword 'new'

ex.

new Patate()
"
Class {
	#name : #FASTJavaNewExpression,
	#superclass : #FASTExpression,
	#traits : 'FASTJavaTReceiver + FASTTWithArguments',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTTWithArguments classTrait',
	#instVars : [
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaNewExpressionOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaNewExpression class >> annotation [

	<FMClass: #NewExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaNewExpression >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaNewExpressionOwner"

	<generated>
	<FMComment: 'The type of the array'>
	^ type
]

{ #category : #accessing }
FASTJavaNewExpression >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #navigation }
FASTJavaNewExpression >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
