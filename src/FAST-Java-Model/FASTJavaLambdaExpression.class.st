"
I represent a lambda expression
"
Class {
	#name : #FASTJavaLambdaExpression,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTExpression + FASTTWithParameters',
	#classTraits : 'FASTTExpression classTrait + FASTTWithParameters classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaLambdaExpression class >> annotation [

	<FMClass: #LambdaExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaLambdaExpression >> expression [
	"Relation named: #expression type: #FASTTEntity opposite: #javaLambdaExpressionOwner"

	<generated>
	<FMComment: 'Expression to be executed as part of the lambda.'>
	<FMProperty: #expression type: #FASTTEntity opposite: #javaLambdaExpressionOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaLambdaExpression >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaLambdaExpressionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaLambdaExpressionOwner: self ]
]

{ #category : #navigation }
FASTJavaLambdaExpression >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
