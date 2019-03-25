"
A node representing method imvocation
"
Class {
	#name : #FASTJavaMethodInvocation,
	#superclass : #FASTExpression,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodInvocation class >> annotation [

	<MSEClass: #MethodInvocation super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaMethodInvocation class >> generatedSlotNames [
	<generated>
	'FASTJavaMethodInvocation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaMethodInvocation class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
FASTJavaMethodInvocation class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaMethodInvocation >> arguments [

	<generated>
	<MSEComment: 'The arguments of the invocation'>
	<MSEProperty: #arguments type: #Object>
	^ self privateState attributeAt: #arguments ifAbsentPut: [ FMMultivalueLink on: self opposite: #javaMethodInvocationArgumentsOwner: ]
]

{ #category : #accessing }
FASTJavaMethodInvocation >> arguments: anObject [

	<generated>
	self arguments value: anObject
]

{ #category : #navigation }
FASTJavaMethodInvocation >> argumentsGroup [

	<generated>
	<navigation: 'Arguments'>
	^ MooseGroup
			withAll: (self arguments asSet)
]

{ #category : #accessing }
FASTJavaMethodInvocation >> receiver [

	<generated>
	<MSEComment: 'The expression whitch will execute this invocation'>
	<MSEProperty: #receiver type: #Object>
	^ self privateState attributeAt: #receiver ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaMethodInvocation >> receiver: anObject [

	<generated>
	(self privateState attributeAt: #receiver ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #receiver put: anObject.
	anObject javaMethodInvocationOwner: self
]

{ #category : #navigation }
FASTJavaMethodInvocation >> receiverGroup [

	<generated>
	<navigation: 'Receiver'>
	^ MooseGroup
			with: (self receiver)
]
