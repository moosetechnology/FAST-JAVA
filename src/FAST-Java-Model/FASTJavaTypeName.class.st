"
I represent the name of a type
"
Class {
	#name : #FASTJavaTypeName,
	#superclass : #FASTExpression,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#instVars : [
		'#javaTypeNameQualify => FMOne type: #FASTJavaQualifiedTypeName opposite: #namespace',
		'#javaTypeNameTypeExpressionOwner => FMOne type: #FASTJavaClassTypeExpression opposite: #typeName'
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
	^ { FASTJavaClassTypeExpression. FASTJavaQualifiedTypeName }
]

{ #category : #accessing }
FASTJavaTypeName >> javaTypeNameQualify [
	"Relation named: #javaTypeNameQualify type: #FASTJavaQualifiedTypeName opposite: #namespace"

	<generated>
	<MSEComment: 'the name I qualify'>
	<container>
	<derived>
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
	<derived>
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
