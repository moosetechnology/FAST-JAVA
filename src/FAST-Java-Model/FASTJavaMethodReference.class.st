"
I represent a method reference
"
Class {
	#name : #FASTJavaMethodReference,
	#superclass : #FASTJavaVariableExpression,
	#instVars : [
		'#receiver => FMOne type: #FASTJavaVariableExpression opposite: #javaMethodReferenceOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodReference class >> annotation [

	<MSEClass: #MethodReference super: #FASTJavaVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaMethodReference >> receiver [
	"Relation named: #receiver type: #FASTJavaVariableExpression opposite: #javaMethodReferenceOwner"

	<generated>
	<MSEComment: 'The method of the reference'>
	^ receiver
]

{ #category : #accessing }
FASTJavaMethodReference >> receiver: anObject [

	<generated>
	receiver := anObject

]

{ #category : #navigation }
FASTJavaMethodReference >> receiverGroup [
	<generated>
	<navigation: 'Receiver'>
	^ MooseGroup with: self receiver
]
