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
		'#declarators => FMMany type: #FASTJavaVariableDeclarator opposite: #varDeclOwner'
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
FASTJavaVarDeclStatement >> belongsTo [

	<generated>
	^ self javaDeclarationOwner

]

{ #category : #accessing }
FASTJavaVarDeclStatement >> belongsTo: anObject [

	<generated>
	self javaDeclarationOwner: anObject

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

	<generated>
	<MSEComment: 'The type of the declared variables'>
	<MSEProperty: #type type: #Object>
	^ self privateState attributeAt: #type ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaVarDeclStatement >> type: anObject [

	<generated>
	(self privateState attributeAt: #type ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self type.
		self privateState attributeAt: #type put: anObject.
		otherSide javaVarDeclTypeOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #type put: anObject.
		anObject javaVarDeclTypeOwner: self ]
]

{ #category : #navigation }
FASTJavaVarDeclStatement >> typeGroup [

	<generated>
	<navigation: 'Type'>
	^ MooseGroup
			with: (self type)
]
