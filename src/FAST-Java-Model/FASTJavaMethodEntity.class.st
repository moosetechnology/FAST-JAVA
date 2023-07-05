"
Represents a method in FastJava
"
Class {
	#name : #FASTJavaMethodEntity,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithModifiers + FASTTNamedBehaviouralEntity + FamixTHasImmediateSource',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithModifiers classTrait + FASTTNamedBehaviouralEntity classTrait + FamixTHasImmediateSource classTrait',
	#instVars : [
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaMethodTypeOwner',
		'#throws => FMMany type: #FASTJavaClassTypeExpression opposite: #javaMethodThrowsOwner',
		'#typeParameters => FMMany type: #FASTJavaTypeParameterExpression opposite: #javaMethodTypeParameterOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodEntity class >> annotation [

	<FMClass: #MethodEntity super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTJavaMethodEntity >> addThrow: anObject [
	<generated>
	^ self throws add: anObject
]

{ #category : #adding }
FASTJavaMethodEntity >> addTypeParameter: anObject [
	<generated>
	^ self typeParameters add: anObject
]

{ #category : #accessing }
FASTJavaMethodEntity >> throws [
	"Relation named: #throws type: #FASTJavaClassTypeExpression opposite: #javaMethodThrowsOwner"

	<generated>
	<FMComment: 'The list of throws exception'>
	<derived>
	^ throws
]

{ #category : #accessing }
FASTJavaMethodEntity >> throws: anObject [

	<generated>
	throws value: anObject
]

{ #category : #navigation }
FASTJavaMethodEntity >> throwsGroup [
	<generated>
	<navigation: 'Throws'>
	^ MooseSpecializedGroup withAll: self throws asSet
]

{ #category : #accessing }
FASTJavaMethodEntity >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaMethodTypeOwner"

	<generated>
	<FMComment: 'The type of the method'>
	^ type
]

{ #category : #accessing }
FASTJavaMethodEntity >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #navigation }
FASTJavaMethodEntity >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]

{ #category : #accessing }
FASTJavaMethodEntity >> typeParameters [
	"Relation named: #typeParameters type: #FASTJavaTypeParameterExpression opposite: #javaMethodTypeParameterOwner"

	<generated>
	<FMComment: 'The list of type parameter'>
	<derived>
	^ typeParameters
]

{ #category : #accessing }
FASTJavaMethodEntity >> typeParameters: anObject [

	<generated>
	typeParameters value: anObject
]

{ #category : #navigation }
FASTJavaMethodEntity >> typeParametersGroup [
	<generated>
	<navigation: 'TypeParameters'>
	^ MooseSpecializedGroup withAll: self typeParameters asSet
]
