"
I represent a type
"
Class {
	#name : #FASTJavaTypeExpression,
	#superclass : #FASTJavaVariableExpression,
	#instVars : [
		'#javaClassDeclarationInterfaceOwnver => FMOne type: #FASTJavaClassDeclaration opposite: #interfaces',
		'#javaClassDeclarationSuperclassOwnver => FMOne type: #FASTJavaClassDeclaration opposite: #superclass'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaTypeExpression class >> annotation [

	<MSEClass: #TypeExpression super: #FASTJavaVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaTypeExpression class >> requirements [

	<generated>
	^ { FASTJavaClassDeclaration }
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaClassDeclarationInterfaceOwnver [
	"Relation named: #javaClassDeclarationInterfaceOwnver type: #FASTJavaClassDeclaration opposite: #interfaces"

	<generated>
	<MSEComment: 'The class that own me'>
	<container>
	^ javaClassDeclarationInterfaceOwnver
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaClassDeclarationInterfaceOwnver: anObject [

	<generated>
	javaClassDeclarationInterfaceOwnver := anObject

]

{ #category : #navigation }
FASTJavaTypeExpression >> javaClassDeclarationInterfaceOwnverGroup [
	<generated>
	<navigation: 'JavaClassDeclarationInterfaceOwnver'>
	^ MooseGroup with: self javaClassDeclarationInterfaceOwnver
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaClassDeclarationSuperclassOwnver [
	"Relation named: #javaClassDeclarationSuperclassOwnver type: #FASTJavaClassDeclaration opposite: #superclass"

	<generated>
	<MSEComment: 'The class that own me'>
	<container>
	^ javaClassDeclarationSuperclassOwnver
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaClassDeclarationSuperclassOwnver: anObject [

	<generated>
	javaClassDeclarationSuperclassOwnver := anObject

]

{ #category : #navigation }
FASTJavaTypeExpression >> javaClassDeclarationSuperclassOwnverGroup [
	<generated>
	<navigation: 'JavaClassDeclarationSuperclassOwnver'>
	^ MooseGroup with: self javaClassDeclarationSuperclassOwnver
]
