"
A part of variable declaration statement containing a variable (named entity) and an expression (optional) that is assigned to it.

Variables declaration statement can contain several declarators.

eg.

int d = 3, e, f = 5;
statement has 3 declarators separated by commas. Second declarator has no expression.
"
Class {
	#name : #FASTJavaVariableDeclarator,
	#superclass : #FASTEntity,
	#instVars : [
		'#varDeclOwner => FMOne type: #FASTJavaVarDeclStatement opposite: #declarators',
		'#variable => FMOne type: #FASTJavaVariableExpression opposite: #javaVariableDeclaratorOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaVariableDeclarator class >> annotation [

	<FMClass: #VariableDeclarator super: #FASTEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> expression [
	"Relation named: #expression type: #FASTExpression opposite: #javaVariableDeclaratorExpressionOwner"

	<generated>
	<FMComment: 'Expression that s being assigned upon declaration to the var'>
	<FMProperty: #expression type: #FASTExpression opposite: #javaVariableDeclaratorExpressionOwner>
	<package: #'Carrefour-Model'>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self privateState attributeAt: #expression put: anObject.
		otherSide javaVariableDeclaratorExpressionOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #expression put: anObject.
		anObject javaVariableDeclaratorExpressionOwner: self ]
]

{ #category : #navigation }
FASTJavaVariableDeclarator >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseGroup with: self expression
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> varDeclOwner [
	"Relation named: #varDeclOwner type: #FASTJavaVarDeclStatement opposite: #declarators"

	<generated>
	<FMComment: 'The owner of the declarator'>
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
	^ MooseGroup with: self varDeclOwner
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> variable [
	"Relation named: #variable type: #FASTJavaVariableExpression opposite: #javaVariableDeclaratorOwner"

	<generated>
	<FMComment: 'Variable that s being declared'>
	^ variable
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> variable: anObject [

	<generated>
	variable := anObject
]

{ #category : #navigation }
FASTJavaVariableDeclarator >> variableGroup [
	<generated>
	<navigation: 'Variable'>
	^ MooseGroup with: self variable
]
