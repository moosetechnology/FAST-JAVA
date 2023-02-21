"
I represent JavaTypeParameter such as `void <T extends Hello> T myMethod()`
"
Class {
	#name : #FASTJavaTypeParameterExpression,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#instVars : [
		'#javaMethodTypeParameterOwner => FMOne type: #FASTJavaMethodEntity opposite: #typeParameters'
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
