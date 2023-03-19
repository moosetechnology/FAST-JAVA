"
I represent a type
"
Class {
	#name : #FASTJavaTypeExpression,
	#superclass : #FASTJavaVariableExpression,
	#instVars : [
		'#javaClassDeclarationInterfaceOwnver => FMOne type: #FASTJavaClassDeclaration opposite: #interfaces',
		'#javaClassDeclarationSuperclassOwnver => FMOne type: #FASTJavaClassDeclaration opposite: #superclass',
		'#javaEnumDeclarationInterfaceOwnver => FMOne type: #FASTJavaEnumDeclaration opposite: #interfaces',
		'#javaInterfaceDeclarationInterfaceOwnver => FMOne type: #FASTJavaInterfaceDeclaration opposite: #interfaces'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaTypeExpression class >> annotation [

	<FMClass: #TypeExpression super: #FASTJavaVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
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

{ #category : #accessing }
FASTJavaTypeExpression >> javaEnumDeclarationInterfaceOwnver [
	"Relation named: #javaEnumDeclarationInterfaceOwnver type: #FASTJavaEnumDeclaration opposite: #interfaces"

	<generated>
	<FMComment: 'The class that own me'>
	<container>
	^ javaEnumDeclarationInterfaceOwnver
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaEnumDeclarationInterfaceOwnver: anObject [

	<generated>
	javaEnumDeclarationInterfaceOwnver := anObject
]

{ #category : #navigation }
FASTJavaTypeExpression >> javaEnumDeclarationInterfaceOwnverGroup [
	<generated>
	<navigation: 'JavaEnumDeclarationInterfaceOwnver'>
	^ MooseSpecializedGroup with: self javaEnumDeclarationInterfaceOwnver
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaInterfaceDeclarationInterfaceOwnver [
	"Relation named: #javaInterfaceDeclarationInterfaceOwnver type: #FASTJavaInterfaceDeclaration opposite: #interfaces"

	<generated>
	<FMComment: 'The interface that own me'>
	<container>
	^ javaInterfaceDeclarationInterfaceOwnver
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaInterfaceDeclarationInterfaceOwnver: anObject [

	<generated>
	javaInterfaceDeclarationInterfaceOwnver := anObject
]

{ #category : #navigation }
FASTJavaTypeExpression >> javaInterfaceDeclarationInterfaceOwnverGroup [
	<generated>
	<navigation: 'JavaInterfaceDeclarationInterfaceOwnver'>
	^ MooseSpecializedGroup with: self javaInterfaceDeclarationInterfaceOwnver
]
