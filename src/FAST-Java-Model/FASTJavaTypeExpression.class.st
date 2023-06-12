"
I represent a type
"
Class {
	#name : #FASTJavaTypeExpression,
	#superclass : #FASTJavaVariableExpression,
	#instVars : [
		'#javaClassDeclarationInterfaceOwner => FMOne type: #FASTJavaClassDeclaration opposite: #interfaces',
		'#javaClassDeclarationSuperclassOwner => FMOne type: #FASTJavaClassDeclaration opposite: #superclass',
		'#javaEnumDeclarationInterfaceOwner => FMOne type: #FASTJavaEnumDeclaration opposite: #interfaces',
		'#javaForEachStatementTypeOwner => FMOne type: #FASTJavaForEachStatement opposite: #type',
		'#javaInterfaceDeclarationInterfaceOwner => FMOne type: #FASTJavaInterfaceDeclaration opposite: #interfaces'
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
FASTJavaTypeExpression >> javaClassDeclarationInterfaceOwner [
	"Relation named: #javaClassDeclarationInterfaceOwner type: #FASTJavaClassDeclaration opposite: #interfaces"

	<generated>
	<FMComment: 'The class that implements me'>
	<container>
	^ javaClassDeclarationInterfaceOwner
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaClassDeclarationInterfaceOwner: anObject [

	<generated>
	javaClassDeclarationInterfaceOwner := anObject
]

{ #category : #navigation }
FASTJavaTypeExpression >> javaClassDeclarationInterfaceOwnerGroup [
	<generated>
	<navigation: 'JavaClassDeclarationInterfaceOwner'>
	^ MooseSpecializedGroup with: self javaClassDeclarationInterfaceOwner
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaClassDeclarationSuperclassOwner [
	"Relation named: #javaClassDeclarationSuperclassOwner type: #FASTJavaClassDeclaration opposite: #superclass"

	<generated>
	<FMComment: 'The class that extends me'>
	<container>
	<derived>
	^ javaClassDeclarationSuperclassOwner
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaClassDeclarationSuperclassOwner: anObject [

	<generated>
	javaClassDeclarationSuperclassOwner := anObject
]

{ #category : #navigation }
FASTJavaTypeExpression >> javaClassDeclarationSuperclassOwnerGroup [
	<generated>
	<navigation: 'JavaClassDeclarationSuperclassOwner'>
	^ MooseSpecializedGroup with: self javaClassDeclarationSuperclassOwner
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaEnumDeclarationInterfaceOwner [
	"Relation named: #javaEnumDeclarationInterfaceOwner type: #FASTJavaEnumDeclaration opposite: #interfaces"

	<generated>
	<FMComment: 'The enum that implements me'>
	<container>
	^ javaEnumDeclarationInterfaceOwner
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaEnumDeclarationInterfaceOwner: anObject [

	<generated>
	javaEnumDeclarationInterfaceOwner := anObject
]

{ #category : #navigation }
FASTJavaTypeExpression >> javaEnumDeclarationInterfaceOwnerGroup [
	<generated>
	<navigation: 'JavaEnumDeclarationInterfaceOwner'>
	^ MooseSpecializedGroup with: self javaEnumDeclarationInterfaceOwner
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaForEachStatementTypeOwner [
	"Relation named: #javaForEachStatementTypeOwner type: #FASTJavaForEachStatement opposite: #type"

	<generated>
	<FMComment: 'The javaForEachStatement owner (if possible)'>
	<container>
	<derived>
	^ javaForEachStatementTypeOwner
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaForEachStatementTypeOwner: anObject [

	<generated>
	javaForEachStatementTypeOwner := anObject
]

{ #category : #navigation }
FASTJavaTypeExpression >> javaForEachStatementTypeOwnerGroup [
	<generated>
	<navigation: 'JavaForEachStatementTypeOwner'>
	^ MooseSpecializedGroup with: self javaForEachStatementTypeOwner
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaInterfaceDeclarationInterfaceOwner [
	"Relation named: #javaInterfaceDeclarationInterfaceOwner type: #FASTJavaInterfaceDeclaration opposite: #interfaces"

	<generated>
	<FMComment: 'The interface that extends me'>
	<container>
	^ javaInterfaceDeclarationInterfaceOwner
]

{ #category : #accessing }
FASTJavaTypeExpression >> javaInterfaceDeclarationInterfaceOwner: anObject [

	<generated>
	javaInterfaceDeclarationInterfaceOwner := anObject
]

{ #category : #navigation }
FASTJavaTypeExpression >> javaInterfaceDeclarationInterfaceOwnerGroup [
	<generated>
	<navigation: 'JavaInterfaceDeclarationInterfaceOwner'>
	^ MooseSpecializedGroup with: self javaInterfaceDeclarationInterfaceOwner
]
