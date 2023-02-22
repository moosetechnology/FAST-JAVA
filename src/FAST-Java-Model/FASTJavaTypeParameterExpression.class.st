"
I represent JavaTypeParameter such as `void <T extends Hello> T myMethod()`
"
Class {
	#name : #FASTJavaTypeParameterExpression,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTExpression + FASTTNamedEntity',
	#classTraits : 'FASTTExpression classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#javaMethodTypeParameterOwner => FMOne type: #FASTJavaMethodEntity opposite: #typeParameters',
		'#types => FMMany type: #FASTJavaClassTypeExpression opposite: #typeParameterOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaTypeParameterExpression class >> annotation [

	<FMClass: #TypeParameterExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTJavaTypeParameterExpression >> addType: anObject [
	<generated>
	^ self types add: anObject
]

{ #category : #accessing }
FASTJavaTypeParameterExpression >> javaMethodTypeParameterOwner [
	"Relation named: #javaMethodTypeParameterOwner type: #FASTJavaMethodEntity opposite: #typeParameters"

	<generated>
	<FMComment: 'The method that use me'>
	<container>
	^ javaMethodTypeParameterOwner
]

{ #category : #accessing }
FASTJavaTypeParameterExpression >> javaMethodTypeParameterOwner: anObject [

	<generated>
	javaMethodTypeParameterOwner := anObject
]

{ #category : #navigation }
FASTJavaTypeParameterExpression >> javaMethodTypeParameterOwnerGroup [
	<generated>
	<navigation: 'JavaMethodTypeParameterOwner'>
	^ MooseSpecializedGroup with: self javaMethodTypeParameterOwner
]

{ #category : #accessing }
FASTJavaTypeParameterExpression >> types [
	"Relation named: #types type: #FASTJavaClassTypeExpression opposite: #typeParameterOwner"

	<generated>
	<FMComment: 'The list of types I extend or implements'>
	<derived>
	^ types
]

{ #category : #accessing }
FASTJavaTypeParameterExpression >> types: anObject [

	<generated>
	types value: anObject
]

{ #category : #navigation }
FASTJavaTypeParameterExpression >> typesGroup [
	<generated>
	<navigation: 'Types'>
	^ MooseSpecializedGroup withAll: self types asSet
]
