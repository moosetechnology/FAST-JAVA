"
A statement of variable declaration

Variables declaration statement can contain several declarators.

eg.

int d = 3, e, f = 5;
statement has 3 declarators separated by commas. Second declarator has no expression.
"
Class {
	#name : #FASTJavaVarDeclStatement,
	#superclass : #FASTStatement,
	#traits : 'FASTJavaTDeclaration',
	#classTraits : 'FASTJavaTDeclaration classTrait',
	#instVars : [
		'#declarators => FMMany type: #FASTJavaVariableDeclarator opposite: #varDeclOwner',
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaVarDeclTypeOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaVarDeclStatement class >> annotation [

	<MSEClass: #VarDeclStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaVarDeclStatement class >> requirements [

	<generated>
	^ { FASTJavaClassDeclaration }
]

{ #category : #adding }
FASTJavaVarDeclStatement >> addDeclarators: anObject [
	<generated>
	^ self declarators add: anObject
]

{ #category : #accessing }
FASTJavaVarDeclStatement >> declarators [
	"Relation named: #declarators type: #FASTJavaVariableDeclarator opposite: #varDeclOwner"

	<generated>
	<MSEComment: 'The declarators for the type'>
	<derived>
	^ declarators
]

{ #category : #accessing }
FASTJavaVarDeclStatement >> declarators: anObject [

	<generated>
	declarators value: anObject

]

{ #category : #navigation }
FASTJavaVarDeclStatement >> declaratorsGroup [
	<generated>
	<navigation: 'Declarators'>
	^ MooseGroup withAll: self declarators asSet
]

{ #category : #accessing }
FASTJavaVarDeclStatement >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaVarDeclTypeOwner"

	<generated>
	<MSEComment: 'The type of the declared variables'>
	^ type
]

{ #category : #accessing }
FASTJavaVarDeclStatement >> type: anObject [

	<generated>
	type := anObject

]

{ #category : #navigation }
FASTJavaVarDeclStatement >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseGroup with: self type
]
