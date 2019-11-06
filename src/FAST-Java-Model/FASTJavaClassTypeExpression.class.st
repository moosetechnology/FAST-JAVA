"
I represent a class type
"
Class {
	#name : #FASTJavaClassTypeExpression,
	#superclass : #FASTJavaTypeExpression,
	#instVars : [
		'#typeName => FMOne type: #FASTJavaTypeName opposite: #javaTypeNameTypeExpressionOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaClassTypeExpression class >> annotation [

	<FMClass: #ClassTypeExpression super: #FASTJavaTypeExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
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
	^ MooseGroup with: self typeName
]
