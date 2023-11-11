"
I represent the name of a type
"
Class {
	#name : #FASTJavaTypeName,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAnnotationElement + FASTTExpression + FASTTNamedEntity',
	#classTraits : 'FASTJavaTAnnotationElement classTrait + FASTTExpression classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#javaTypeNameTypeExpressionOwner => FMOne type: #FASTJavaClassTypeExpression opposite: #typeName',
		'#javaTypeNameQualify => FMOne type: #FASTJavaQualifiedTypeName opposite: #namespace'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaTypeName class >> annotation [

	<FMClass: #TypeName super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
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
	<FMComment: 'The type expression that owns me'>
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
