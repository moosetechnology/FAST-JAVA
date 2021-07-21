"
I represent a method reference
"
Class {
	#name : #FASTJavaMethodReference,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTExpression + FASTTNamedEntity',
	#classTraits : 'FASTTExpression classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#receiver => FMOne type: #FASTJavaVariableExpression opposite: #javaMethodReferenceOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodReference class >> annotation [

	<FMClass: #MethodReference super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaMethodReference >> receiver [
	"Relation named: #receiver type: #FASTJavaVariableExpression opposite: #javaMethodReferenceOwner"

	<generated>
	<FMComment: 'The method of the reference'>
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
	^ MooseSpecializedGroup with: self receiver
]
