"
A part of variable declaration statement containing a variable (named entity) and an expression (optional) that is assigned to it.

Variables declaration statement can contain several declarators.

eg.

int d = 3, e, f = 5;
statement has 3 declarators separated by commas. Second declarator has no expression.
"
Class {
	#name : #FASTJavaVariableDeclarator,
	#superclass : #FASTEntitySourceAnchor,
	#instVars : [
		'#varDeclOwner => FMOne type: #FASTJavaVarDeclStatement opposite: #declarators'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaVariableDeclarator class >> annotation [

	<MSEClass: #VariableDeclarator super: #FASTEntitySourceAnchor>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaVariableDeclarator class >> generatedSlotNames [
	<generated>
	'FASTJavaVariableDeclarator class>>#generatedSlotNames'.
	^ #(varDeclOwner)
]

{ #category : #generator }
FASTJavaVariableDeclarator class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaVariableDeclarator class >> requirements [

	<generated>
	^ { FASTJavaVarDeclStatement }
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> expression [

	<generated>
	<MSEComment: 'Expression that s being assigned upon declaration to the var'>
	<MSEProperty: #expression type: #Object>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #expression put: anObject.
	anObject javaVariableDeclaratorExpressionOwner: self
]

{ #category : #navigation }
FASTJavaVariableDeclarator >> expressionGroup [

	<generated>
	<navigation: 'Expression'>
	^ MooseGroup
			with: (self expression)
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> varDeclOwner [

	<generated>
	<MSEComment: 'The owner of the declarator'>
	<container>

	^ varDeclOwner
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> varDeclOwner: anObject [

	<generated>
	varDeclOwner := anObject

]

{ #category : #navigation }
FASTJavaVariableDeclarator >> varDeclOwnerGroup [

	<generated>
	<navigation: 'VarDeclOwner'>
	^ MooseGroup
			with: (self varDeclOwner)
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> variable [

	<generated>
	<MSEComment: 'Variable that s being declared'>
	<MSEProperty: #variable type: #Object>
	^ self privateState attributeAt: #variable ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> variable: anObject [

	<generated>
	(self privateState attributeAt: #variable ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #variable put: anObject.
	anObject javaVariableDeclaratorOwner: self
]

{ #category : #navigation }
FASTJavaVariableDeclarator >> variableGroup [

	<generated>
	<navigation: 'Variable'>
	^ MooseGroup
			with: (self variable)
]
