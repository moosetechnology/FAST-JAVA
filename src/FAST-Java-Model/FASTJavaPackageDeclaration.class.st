"
I represent a package declaration, e.g. `package fr.inria;`
"
Class {
	#name : #FASTJavaPackageDeclaration,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTWithQualifiedName + FASTTEntity',
	#classTraits : 'FASTJavaTWithQualifiedName classTrait + FASTTEntity classTrait',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #packageDeclaration'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaPackageDeclaration class >> annotation [

	<FMClass: #PackageDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaPackageDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #packageDeclaration"

	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	<derived>
	^ compilationUnit
]

{ #category : #accessing }
FASTJavaPackageDeclaration >> compilationUnit: anObject [

	<generated>
	compilationUnit := anObject
]

{ #category : #navigation }
FASTJavaPackageDeclaration >> compilationUnitGroup [
	<generated>
	<navigation: 'CompilationUnit'>
	^ MooseSpecializedGroup with: self compilationUnit
]
