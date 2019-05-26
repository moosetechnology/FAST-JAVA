"
I represent a lambda expression
"
Class {
	#name : #FASTJavaLambdaExpression,
	#superclass : #FASTExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaLambdaExpression class >> annotation [

	<MSEClass: #LambdaExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaLambdaExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaLambdaExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaLambdaExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaLambdaExpression class >> requirements [

	<generated>
	^ {  }
]

{ #category : #adding }
FASTJavaLambdaExpression >> addParameters: anObject [
			
	<generated>
	^ self parameters add: anObject
]

{ #category : #accessing }
FASTJavaLambdaExpression >> expression [

	<generated>
	<MSEComment: 'Expression to be executed as part of the lambda.'>
	<MSEProperty: #expression type: #Object>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaLambdaExpression >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #expression put: anObject.
	anObject javaLambdaExpressionOwner: self
]

{ #category : #navigation }
FASTJavaLambdaExpression >> expressionGroup [

	<generated>
	<navigation: 'Expression'>
	^ MooseGroup
			with: (self expression)
]

{ #category : #accessing }
FASTJavaLambdaExpression >> parameters [

	<generated>
	<MSEComment: 'The parameters of the lambda'>
	<MSEProperty: #parameters type: #Object>
	^ self privateState attributeAt: #parameters ifAbsentPut: [ FMMultivalueLink on: self opposite: #javaLambdaParameterOwner: ]
]

{ #category : #accessing }
FASTJavaLambdaExpression >> parameters: anObject [

	<generated>
	self parameters value: anObject
]

{ #category : #navigation }
FASTJavaLambdaExpression >> parametersGroup [

	<generated>
	<navigation: 'Parameters'>
	^ MooseGroup
			withAll: (self parameters asSet)
]
