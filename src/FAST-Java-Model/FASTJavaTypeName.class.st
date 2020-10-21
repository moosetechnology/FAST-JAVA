"
I represent the name of a type
"
Class {
	#name : #FASTJavaTypeName,
	#superclass : #FASTExpression,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#instVars : [
		'#javaTypeNameTypeExpressionOwner => FMOne type: #FASTJavaClassTypeExpression opposite: #typeName',
		'#javaTypeNameQualify => FMOne type: #FASTJavaQualifiedTypeName opposite: #namespace'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaTypeName class >> annotation [

	<FMClass: #TypeName super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaTypeName >> javaTypeNameQualify [
	"Relation named: #javaTypeNameQualify type: #FASTJavaQualifiedTypeName opposite: #namespace"

	<generated>
	<FMComment: 'the name I qualify'>
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
	^ MooseSpecializedGroup with: self javaTypeNameQualify
]

{ #category : #accessing }
FASTJavaTypeName >> javaTypeNameTypeExpressionOwner [
	"Relation named: #javaTypeNameTypeExpressionOwner type: #FASTJavaClassTypeExpression opposite: #typeName"

	<generated>
	<FMComment: 'The type expression that own me'>
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
	^ MooseSpecializedGroup with: self javaTypeNameTypeExpressionOwner
]
