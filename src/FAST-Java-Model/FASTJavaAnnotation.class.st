"
I reprensent a Java Annotation

example:

@Override
"
Class {
	#name : #FASTJavaAnnotation,
	#superclass : #FASTExpression,
	#traits : 'FASTJavaTModifier',
	#classTraits : 'FASTJavaTModifier classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAnnotation class >> annotation [

	<MSEClass: #Annotation super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaAnnotation class >> requirements [

	<generated>
	^ { FASTJavaClassDeclaration. FASTJavaMethodEntity }
]

{ #category : #accessing }
FASTJavaAnnotation >> expression [
	"Relation named: #expression type: #FASTJavaVariableExpression opposite: #variableExpressionOwnerIsAnnotation"

	<generated>
	<MSEComment: 'My expression (because annotation can be complex)'>
	<MSEProperty: #expression type: #Object>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaAnnotation >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self privateState attributeAt: #expression put: anObject.
		otherSide variableExpressionOwnerIsAnnotation: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #expression put: anObject.
		anObject variableExpressionOwnerIsAnnotation: self ]
]

{ #category : #navigation }
FASTJavaAnnotation >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseGroup with: self expression
]
