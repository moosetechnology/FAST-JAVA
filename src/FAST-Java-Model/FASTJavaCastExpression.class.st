"
todo
"
Class {
	#name : #FASTJavaCastExpression,
	#superclass : #FASTExpression,
	#instVars : [
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaCastExpressionTypeOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaCastExpression class >> annotation [

	<MSEClass: #CastExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaCastExpression >> expression [
	"Relation named: #expression type: #FASTExpression opposite: #javaCastExpressionOwner"

	<generated>
	<MSEComment: 'The expression to cast'>
	<MSEProperty: #expression type: #FASTExpression opposite: #javaCastExpressionOwner>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaCastExpression >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self privateState attributeAt: #expression put: anObject.
		otherSide javaCastExpressionOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #expression put: anObject.
		anObject javaCastExpressionOwner: self ]
]

{ #category : #navigation }
FASTJavaCastExpression >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseGroup with: self expression
]

{ #category : #accessing }
FASTJavaCastExpression >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaCastExpressionTypeOwner"

	<generated>
	<MSEComment: 'The type in witch the expression will be cast'>
	^ type
]

{ #category : #accessing }
FASTJavaCastExpression >> type: anObject [

	<generated>
	type := anObject

]

{ #category : #navigation }
FASTJavaCastExpression >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseGroup with: self type
]
