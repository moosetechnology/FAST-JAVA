"
Represents a method in FastJava
"
Class {
	#name : #FASTJavaMethodEntity,
	#superclass : #FASTNamedBehaviouralEntity,
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithModifiers + FamixTHasImmediateSource',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithModifiers classTrait + FamixTHasImmediateSource classTrait',
	#instVars : [
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaMethodTypeOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodEntity class >> annotation [

	<FMClass: #MethodEntity super: #FASTNamedBehaviouralEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
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
	^ MooseGroup with: self type
]
