"
I represent a parameter of a method declaration
"
Class {
	#name : #FASTJavaParameter,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTExpression + FASTTVariableEntity',
	#classTraits : 'FASTTExpression classTrait + FASTTVariableEntity classTrait',
	#instVars : [
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaParameterTypeOwner',
		'#variable => FMOne type: #FASTJavaVariableExpression opposite: #javaParameterVariableOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaParameter class >> annotation [

	<FMClass: #Parameter super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaParameter >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaParameterTypeOwner"

	<generated>
	<FMComment: 'The type of the parameter'>
	^ type
]

{ #category : #accessing }
FASTJavaParameter >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #navigation }
FASTJavaParameter >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]

{ #category : #accessing }
FASTJavaParameter >> variable [
	"Relation named: #variable type: #FASTJavaVariableExpression opposite: #javaParameterVariableOwner"

	<generated>
	<FMComment: 'parameter variable'>
	^ variable
]

{ #category : #accessing }
FASTJavaParameter >> variable: anObject [

	<generated>
	variable := anObject
]

{ #category : #navigation }
FASTJavaParameter >> variableGroup [
	<generated>
	<navigation: 'Variable'>
	^ MooseSpecializedGroup with: self variable
]
