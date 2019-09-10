"
I represent a parameter of a method declaration
"
Class {
	#name : #FASTJavaParameter,
	#superclass : #FASTJavaVariableExpression,
	#instVars : [
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaParameterTypeOwner',
		'#variable => FMOne type: #FASTJavaVariableExpression opposite: #javaParameterVariableOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaParameter class >> annotation [

	<MSEClass: #Parameter super: #FASTJavaVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaParameter >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaParameterTypeOwner"

	<generated>
	<MSEComment: 'The type of the parameter'>
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
	^ MooseGroup with: self type
]

{ #category : #accessing }
FASTJavaParameter >> variable [
	"Relation named: #variable type: #FASTJavaVariableExpression opposite: #javaParameterVariableOwner"

	<generated>
	<MSEComment: 'parameter variable'>
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
	^ MooseGroup with: self variable
]
