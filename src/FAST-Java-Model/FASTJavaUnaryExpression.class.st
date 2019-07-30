"
I represent a Java Unary Expression
	
It can be :

++i
i++
--i
i--
!b
+i
-i

see: https://docs.oracle.com/javase/tutorial/java/nutsandbolts/op1.html
"
Class {
	#name : #FASTJavaUnaryExpression,
	#superclass : #FASTExpression,
	#instVars : [
		'#operator => FMProperty',
		'#isPrefixedUnaryExpression => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaUnaryExpression class >> annotation [

	<MSEClass: #UnaryExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaUnaryExpression >> expression [

	<generated>
	<MSEComment: 'The affected expression'>
	<MSEProperty: #expression type: #Object>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaUnaryExpression >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self privateState attributeAt: #expression put: anObject.
		otherSide javaUnaryExpressionOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #expression put: anObject.
		anObject javaUnaryExpressionOwner: self ]
]

{ #category : #navigation }
FASTJavaUnaryExpression >> expressionGroup [

	<generated>
	<navigation: 'Expression'>
	^ MooseGroup
			with: (self expression)
]

{ #category : #accessing }
FASTJavaUnaryExpression >> isPrefixedUnaryExpression [

	<MSEProperty: #isPrefixedUnaryExpression type: #Boolean>
	<generated>
	<MSEComment: 'true if the expression is prefixed (ex. ++i) else false'>
	^ isPrefixedUnaryExpression
]

{ #category : #accessing }
FASTJavaUnaryExpression >> isPrefixedUnaryExpression: anObject [

	<generated>
	isPrefixedUnaryExpression := anObject

]

{ #category : #accessing }
FASTJavaUnaryExpression >> operator [

	<MSEProperty: #operator type: #String>
	<generated>
	<MSEComment: 'The operator string to apply to the expression'>
	^ operator
]

{ #category : #accessing }
FASTJavaUnaryExpression >> operator: anObject [

	<generated>
	operator := anObject

]
