"
I reprensent a Java Annotation

example:

@Override
"
Class {
	#name : #FASTJavaAnnotation,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTModifier + FASTTExpression',
	#classTraits : 'FASTJavaTModifier classTrait + FASTTExpression classTrait',
	#instVars : [
		'#expression => FMOne type: #FASTJavaVariableExpression opposite: #javaVariableExpressionOwnerIsAnnotation'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAnnotation class >> annotation [

	<FMClass: #Annotation super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaAnnotation >> expression [
	"Relation named: #expression type: #FASTJavaVariableExpression opposite: #javaVariableExpressionOwnerIsAnnotation"

	<generated>
	<FMComment: 'My expression (because annotation can be complex)'>
	^ expression
]

{ #category : #accessing }
FASTJavaAnnotation >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTJavaAnnotation >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
