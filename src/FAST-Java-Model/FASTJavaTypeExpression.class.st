"
I represent a type
"
Class {
	#name : #FASTJavaTypeExpression,
	#superclass : #FASTJavaVariableExpression,
	#instVars : [
		'#javaClassDeclarationSuperclassOwnver => FMOne type: #FASTJavaClassDeclaration opposite: #superclass',
		'#javaClassDeclarationInterfaceOwnver => FMOne type: #FASTJavaClassDeclaration opposite: #interfaces'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaTypeExpression class >> annotation [

	<FMClass: #TypeExpression super: #FASTJavaVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaClassDeclarationInterfaceOwnver [
	"Relation named: #javaClassDeclarationInterfaceOwnver type: #FASTJavaClassDeclaration opposite: #interfaces"

	<generated>
	<FMComment: 'The class that own me'>
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
	^ MooseSpecializedGroup with: self javaClassDeclarationInterfaceOwnver
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaClassDeclarationSuperclassOwnver [
	"Relation named: #javaClassDeclarationSuperclassOwnver type: #FASTJavaClassDeclaration opposite: #superclass"

	<generated>
	<FMComment: 'The class that own me'>
	<container>
	<derived>
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
	^ MooseSpecializedGroup with: self javaClassDeclarationSuperclassOwnver
]
