"
I represent a class type
"
Class {
	#name : #FASTJavaClassTypeExpression,
	#superclass : #FASTJavaTypeExpression,
	#instVars : [
		'#javaMethodThrowsOwner => FMOne type: #FASTJavaMethodEntity opposite: #throws',
		'#typeParameterOwner => FMOne type: #FASTJavaTypeParameterExpression opposite: #types',
		'#typeName => FMOne type: #FASTJavaTypeName opposite: #javaTypeNameTypeExpressionOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaClassTypeExpression class >> annotation [

	<FMClass: #ClassTypeExpression super: #FASTJavaTypeExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaClassTypeExpression >> javaMethodThrowsOwner [
	"Relation named: #javaMethodThrowsOwner type: #FASTJavaMethodEntity opposite: #throws"

	<generated>
	<FMComment: 'The method that throws me'>
	<container>
	^ javaMethodThrowsOwner
]

{ #category : #accessing }
FASTJavaClassTypeExpression >> javaMethodThrowsOwner: anObject [

	<generated>
	javaMethodThrowsOwner := anObject
]

{ #category : #navigation }
FASTJavaClassTypeExpression >> javaMethodThrowsOwnerGroup [
	<generated>
	<navigation: 'JavaMethodThrowsOwner'>
	^ MooseSpecializedGroup with: self javaMethodThrowsOwner
]

{ #category : #accessing }
FASTJavaClassTypeExpression >> typeName [
	"Relation named: #typeName type: #FASTJavaTypeName opposite: #javaTypeNameTypeExpressionOwner"

	<generated>
	<FMComment: 'The name of the type'>
	^ typeName
]

{ #category : #accessing }
FASTJavaClassTypeExpression >> typeName: anObject [

	<generated>
	typeName := anObject
]

{ #category : #navigation }
FASTJavaClassTypeExpression >> typeNameGroup [
	<generated>
	<navigation: 'TypeName'>
	^ MooseSpecializedGroup with: self typeName
]

{ #category : #accessing }
FASTJavaClassTypeExpression >> typeParameterOwner [
	"Relation named: #typeParameterOwner type: #FASTJavaTypeParameterExpression opposite: #types"

	<generated>
	<FMComment: 'The type parameter I specify'>
	<container>
	^ typeParameterOwner
]

{ #category : #accessing }
FASTJavaClassTypeExpression >> typeParameterOwner: anObject [

	<generated>
	typeParameterOwner := anObject
]

{ #category : #navigation }
FASTJavaClassTypeExpression >> typeParameterOwnerGroup [
	<generated>
	<navigation: 'TypeParameterOwner'>
	^ MooseSpecializedGroup with: self typeParameterOwner
]
