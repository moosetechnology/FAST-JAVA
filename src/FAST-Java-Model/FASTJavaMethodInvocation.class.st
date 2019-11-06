"
A node representing method imvocation
"
Class {
	#name : #FASTJavaMethodInvocation,
	#superclass : #FASTExpression,
	#traits : 'FASTTWithArguments + FamixTNamed',
	#classTraits : 'FASTTWithArguments classTrait + FamixTNamed classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodInvocation class >> annotation [

	<FMClass: #MethodInvocation super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaMethodInvocation >> receiver [
	"Relation named: #receiver type: #FASTExpression opposite: #javaMethodInvocationOwner"

	<generated>
	<FMComment: 'The expression whitch will execute this invocation'>
	<FMProperty: #receiver type: #FASTExpression opposite: #javaMethodInvocationOwner>
	<package: #'Carrefour-Model'>
	^ self privateState attributeAt: #receiver ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaMethodInvocation >> receiver: anObject [

	<generated>
	(self privateState attributeAt: #receiver ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self receiver.
		self privateState attributeAt: #receiver put: anObject.
		otherSide javaMethodInvocationOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #receiver put: anObject.
		anObject javaMethodInvocationOwner: self ]
]

{ #category : #navigation }
FASTJavaMethodInvocation >> receiverGroup [
	<generated>
	<navigation: 'Receiver'>
	^ MooseGroup with: self receiver
]
