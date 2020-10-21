"
todo
"
Class {
	#name : #FASTJavaCastExpression,
	#superclass : #FASTExpression,
	#traits : 'FASTJavaTReceiver',
	#classTraits : 'FASTJavaTReceiver classTrait',
	#instVars : [
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaCastExpressionTypeOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaCastExpression class >> annotation [

	<FMClass: #CastExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaCastExpression >> expression [
	"Relation named: #expression type: #FASTExpression opposite: #javaCastExpressionOwner"

	<generated>
	<FMComment: 'The expression to cast'>
	<FMProperty: #expression type: #FASTExpression opposite: #javaCastExpressionOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaCastExpression >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaCastExpressionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaCastExpressionOwner: self ]
]

{ #category : #navigation }
FASTJavaCastExpression >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : #accessing }
FASTJavaCastExpression >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaCastExpressionTypeOwner"

	<generated>
	<FMComment: 'The type in witch the expression will be cast'>
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
	^ MooseSpecializedGroup with: self type
]
