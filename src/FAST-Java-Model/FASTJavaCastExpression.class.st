"
todo
"
Class {
	#name : #FASTJavaCastExpression,
	#superclass : #FASTExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaCastExpression class >> annotation [

	<MSEClass: #CastExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaCastExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaCastExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaCastExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaCastExpression class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaCastExpression >> expression [

	<generated>
	<MSEComment: 'The expression to cast'>
	<MSEProperty: #expression type: #Object>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaCastExpression >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #expression put: anObject.
	anObject javaCastExpressionOwner: self
]

{ #category : #navigation }
FASTJavaCastExpression >> expressionGroup [

	<generated>
	<navigation: 'Expression'>
	^ MooseGroup
			with: (self expression)
]

{ #category : #accessing }
FASTJavaCastExpression >> type [

	<generated>
	<MSEComment: 'The type in witch the expression will be cast'>
	<MSEProperty: #type type: #Object>
	^ self privateState attributeAt: #type ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaCastExpression >> type: anObject [

	<generated>
	(self privateState attributeAt: #type ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #type put: anObject.
	anObject javaCastExpressionTypeOwner: self
]

{ #category : #navigation }
FASTJavaCastExpression >> typeGroup [

	<generated>
	<navigation: 'Type'>
	^ MooseGroup
			with: (self type)
]
