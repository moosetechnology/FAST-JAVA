"
I represent the invocation of a Class constructor with the keyword 'new'

ex.

new Patate()
"
Class {
	#name : #FASTJavaNewExpression,
	#superclass : #FASTExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaNewExpression class >> annotation [

	<MSEClass: #NewExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaNewExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaNewExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaNewExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaNewExpression class >> requirements [

	<generated>
	^ {  }
]

{ #category : #adding }
FASTJavaNewExpression >> addArguments: anObject [
			
	<generated>
	^ self arguments add: anObject
]

{ #category : #accessing }
FASTJavaNewExpression >> arguments [

	<generated>
	<MSEComment: 'the arguments of the new expression'>
	<MSEProperty: #arguments type: #Object>
	^ self privateState attributeAt: #arguments ifAbsentPut: [ FMMultivalueLink on: self opposite: #javaNewExpressionArgumentsOwner: ]
]

{ #category : #accessing }
FASTJavaNewExpression >> arguments: anObject [

	<generated>
	self arguments value: anObject
]

{ #category : #navigation }
FASTJavaNewExpression >> argumentsGroup [

	<generated>
	<navigation: 'Arguments'>
	^ MooseGroup
			withAll: (self arguments asSet)
]

{ #category : #accessing }
FASTJavaNewExpression >> type [

	<generated>
	<MSEComment: 'The type of the array'>
	<MSEProperty: #type type: #Object>
	^ self privateState attributeAt: #type ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaNewExpression >> type: anObject [

	<generated>
	(self privateState attributeAt: #type ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #type put: anObject.
	anObject javaNewExpressionOwner: self
]

{ #category : #navigation }
FASTJavaNewExpression >> typeGroup [

	<generated>
	<navigation: 'Type'>
	^ MooseGroup
			with: (self type)
]
