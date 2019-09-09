"
I represent the name of a type
"
Class {
	#name : #FASTJavaTypeName,
	#superclass : #FASTExpression,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#instVars : [
		'#javaArrayTypeOwner => FMOne type: #FASTJavaArrayTypeExpression opposite: #baseType',
		'#javaTypeNameTypeExpressionOwner => FMOne type: #FASTJavaClassTypeExpression opposite: #typeName',
		'#javaTypeNameQualify => FMOne type: #FASTJavaQualifiedTypeName opposite: #namespace'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaTypeName class >> annotation [

	<MSEClass: #TypeName super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaTypeName class >> requirements [

	<generated>
	^ { FASTJavaArrayTypeExpression. FASTJavaClassTypeExpression. FASTJavaQualifiedTypeName }
]

{ #category : #accessing }
FASTJavaTypeName >> javaArrayTypeOwner [
	"Relation named: #javaArrayTypeOwner type: #FASTJavaArrayTypeExpression opposite: #baseType"

	<generated>
	<MSEComment: 'The variable expression owner (if possible)'>
	<container>
	^ javaArrayTypeOwner
]

{ #category : #accessing }
FASTJavaTypeName >> javaArrayTypeOwner: anObject [

	<generated>
	javaArrayTypeOwner := anObject

]

{ #category : #navigation }
FASTJavaTypeName >> javaArrayTypeOwnerGroup [
	<generated>
	<navigation: 'JavaArrayTypeOwner'>
	^ MooseGroup with: self javaArrayTypeOwner
]

{ #category : #accessing }
FASTJavaTypeName >> javaTypeNameQualify [
	"Relation named: #javaTypeNameQualify type: #FASTJavaQualifiedTypeName opposite: #namespace"

	<generated>
	<MSEComment: 'the name I qualify'>
	<container>
	^ javaTypeNameQualify
]

{ #category : #accessing }
FASTJavaTypeName >> javaTypeNameQualify: anObject [

	<generated>
	javaTypeNameQualify := anObject

]

{ #category : #navigation }
FASTJavaTypeName >> javaTypeNameQualifyGroup [
	<generated>
	<navigation: 'JavaTypeNameQualify'>
	^ MooseGroup with: self javaTypeNameQualify
]

{ #category : #accessing }
FASTJavaTypeName >> javaTypeNameTypeExpressionOwner [
	"Relation named: #javaTypeNameTypeExpressionOwner type: #FASTJavaClassTypeExpression opposite: #typeName"

	<generated>
	<MSEComment: 'The type expression that own me'>
	<container>
	^ javaTypeNameTypeExpressionOwner
]

{ #category : #accessing }
FASTJavaTypeName >> javaTypeNameTypeExpressionOwner: anObject [

	<generated>
	javaTypeNameTypeExpressionOwner := anObject

]

{ #category : #navigation }
FASTJavaTypeName >> javaTypeNameTypeExpressionOwnerGroup [
	<generated>
	<navigation: 'JavaTypeNameTypeExpressionOwner'>
	^ MooseGroup with: self javaTypeNameTypeExpressionOwner
]
