"
I represent a lambda expression
"
Class {
	#name : #FASTJavaLambdaExpression,
	#superclass : #FASTExpression,
	#instVars : [
		'#parameters => FMMany type: #FASTJavaVariableExpression opposite: #javaLambdaParameterOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaLambdaExpression class >> annotation [

	<MSEClass: #LambdaExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTJavaLambdaExpression >> addParameters: anObject [
	<generated>
	^ self parameters add: anObject
]

{ #category : #accessing }
FASTJavaLambdaExpression >> expression [
	"Relation named: #expression type: #FASTEntity opposite: #javaLambdaExpressionOwner"

	<generated>
	<MSEComment: 'Expression to be executed as part of the lambda.'>
	<MSEProperty: #expression type: #FASTEntity opposite: #javaLambdaExpressionOwner>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaLambdaExpression >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self privateState attributeAt: #expression put: anObject.
		otherSide javaLambdaExpressionOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #expression put: anObject.
		anObject javaLambdaExpressionOwner: self ]
]

{ #category : #navigation }
FASTJavaLambdaExpression >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseGroup with: self expression
]

{ #category : #accessing }
FASTJavaLambdaExpression >> parameters [
	"Relation named: #parameters type: #FASTJavaVariableExpression opposite: #javaLambdaParameterOwner"

	<generated>
	<MSEComment: 'The parameters of the lambda'>
	<derived>
	^ parameters
]

{ #category : #accessing }
FASTJavaLambdaExpression >> parameters: anObject [

	<generated>
	parameters value: anObject

]

{ #category : #navigation }
FASTJavaLambdaExpression >> parametersGroup [
	<generated>
	<navigation: 'Parameters'>
	^ MooseGroup withAll: self parameters asSet
]
