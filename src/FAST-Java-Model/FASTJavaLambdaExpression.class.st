"
I represent a lambda expression
"
Class {
	#name : #FASTJavaLambdaExpression,
	#superclass : #FASTExpression,
	#traits : 'FASTTWithParameters',
	#classTraits : 'FASTTWithParameters classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaLambdaExpression class >> annotation [

	<FMClass: #LambdaExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaLambdaExpression >> expression [
	"Relation named: #expression type: #FASTEntity opposite: #javaLambdaExpressionOwner"

	<generated>
	<FMComment: 'Expression to be executed as part of the lambda.'>
	<FMProperty: #expression type: #FASTEntity opposite: #javaLambdaExpressionOwner>
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
