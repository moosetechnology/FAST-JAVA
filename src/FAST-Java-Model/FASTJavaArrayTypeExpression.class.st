"
I represent an array type
"
Class {
	#name : #FASTJavaArrayTypeExpression,
	#superclass : #FASTJavaTypeExpression,
	#instVars : [
		'#baseType => FMOne type: #FASTJavaTypeName opposite: #javaArrayTypeOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaArrayTypeExpression class >> annotation [

	<MSEClass: #ArrayTypeExpression super: #FASTJavaTypeExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaArrayTypeExpression >> baseType [

	<generated>
	<MSEComment: 'The type of the array'>
	^ baseType
]

{ #category : #accessing }
FASTJavaArrayTypeExpression >> baseType: anObject [

	<generated>
	baseType := anObject

]

{ #category : #navigation }
FASTJavaArrayTypeExpression >> baseTypeGroup [

	<generated>
	<navigation: 'BaseType'>
	^ MooseGroup
			with: (self baseType)
]
