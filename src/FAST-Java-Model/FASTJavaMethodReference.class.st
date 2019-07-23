"
I represent a method reference
"
Class {
	#name : #FASTJavaMethodReference,
	#superclass : #FASTVariableExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodReference class >> annotation [

	<MSEClass: #MethodReference super: #FASTVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaMethodReference >> receiver [

	<generated>
	<MSEComment: 'The method of the reference'>
	<MSEProperty: #receiver type: #Object>
	^ self privateState attributeAt: #receiver ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaMethodReference >> receiver: anObject [

	<generated>
	(self privateState attributeAt: #receiver ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self receiver.
		self privateState attributeAt: #receiver put: anObject.
		otherSide javaMethodReferenceOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #receiver put: anObject.
		anObject javaMethodReferenceOwner: self ]
]

{ #category : #navigation }
FASTJavaMethodReference >> receiverGroup [

	<generated>
	<navigation: 'Receiver'>
	^ MooseGroup
			with: (self receiver)
]
