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
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#instVars : [
		'#operator => FMProperty',
		'#isPrefixedUnaryExpression => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaUnaryExpression class >> annotation [

	<FMClass: #UnaryExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaUnaryExpression >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #javaUnaryExpressionOwner"

	<generated>
	<FMComment: 'The affected expression'>
	<FMProperty: #expression type: #FASTTExpression opposite: #javaUnaryExpressionOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaUnaryExpression >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaUnaryExpressionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaUnaryExpressionOwner: self ]
]

{ #category : #navigation }
FASTJavaUnaryExpression >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : #accessing }
FASTJavaUnaryExpression >> isPrefixedUnaryExpression [

	<FMProperty: #isPrefixedUnaryExpression type: #Boolean>
	<generated>
	<FMComment: 'true if the expression is prefixed (ex. ++i) else false'>
	^ isPrefixedUnaryExpression
]

{ #category : #accessing }
FASTJavaUnaryExpression >> isPrefixedUnaryExpression: anObject [
	<generated>
	isPrefixedUnaryExpression := anObject
]

{ #category : #accessing }
FASTJavaUnaryExpression >> operator [

	<FMProperty: #operator type: #String>
	<generated>
	<FMComment: 'The operator string to apply to the expression'>
	^ operator
]

{ #category : #accessing }
FASTJavaUnaryExpression >> operator: anObject [
	<generated>
	operator := anObject
]
