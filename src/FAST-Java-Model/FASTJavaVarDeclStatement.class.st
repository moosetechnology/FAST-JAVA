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
	#instVars : [
		'#declarators => FMMany type: #FASTJavaVariableDeclarator opposite: #varDeclOwner',
		'#type'
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

{ #category : #generator }
FASTJavaVarDeclStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaVarDeclStatement class>>#generatedSlotNames'.
	^ #(declarators type)
]

{ #category : #generator }
FASTJavaVarDeclStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaVarDeclStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaVarDeclStatement >> declarators [

	<generated>
	<MSEComment: 'The declarators for the type'>
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
	^ MooseGroup
			withAll: (self declarators asSet)
]

{ #category : #accessing }
FASTJavaVarDeclStatement >> type [

	<MSEProperty: #type type: #Object>
	<generated>
	<MSEComment: 'type of declared variables'>
	^ type
]

{ #category : #accessing }
FASTJavaVarDeclStatement >> type: anObject [

	<generated>
	type := anObject

]
