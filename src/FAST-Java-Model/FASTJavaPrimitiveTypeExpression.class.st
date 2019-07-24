"
I represent a primitive type
"
Class {
	#name : #FASTJavaPrimitiveTypeExpression,
	#superclass : #FASTJavaTypeExpression,
	#instVars : [
		'#javaArrayTypeOwner => FMOne type: #FASTJavaArrayTypeExpression opposite: #baseType'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaPrimitiveTypeExpression class >> annotation [

	<MSEClass: #PrimitiveTypeExpression super: #FASTJavaTypeExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaPrimitiveTypeExpression class >> requirements [

	<generated>
	^ { FASTJavaArrayTypeExpression }
]

{ #category : #accessing }
FASTJavaPrimitiveTypeExpression >> javaArrayTypeOwner [

	<generated>
	<MSEComment: 'The variable expression owner (if possible)'>
	<container>

	^ javaArrayTypeOwner
]

{ #category : #accessing }
FASTJavaPrimitiveTypeExpression >> javaArrayTypeOwner: anObject [

	<generated>
	javaArrayTypeOwner := anObject

]

{ #category : #navigation }
FASTJavaPrimitiveTypeExpression >> javaArrayTypeOwnerGroup [

	<generated>
	<navigation: 'JavaArrayTypeOwner'>
	^ MooseGroup
			with: (self javaArrayTypeOwner)
]
