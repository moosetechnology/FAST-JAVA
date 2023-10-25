"
I represent an enum declaration
example

public enum MyEnum {
	
	HELLO;
	
	int oneDeclaration;
	
	void methodDeclaration(){
	}
}
"
Class {
	#name : #FASTJavaEnumDeclaration,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithModifiers + FASTTNamedEntity + FASTTStatement',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithModifiers classTrait + FASTTNamedEntity classTrait + FASTTStatement classTrait',
	#instVars : [
		'#interfaces => FMMany type: #FASTJavaTypeExpression opposite: #javaEnumDeclarationInterfaceOwner',
		'#constants => FMMany type: #FASTJavaEnumConstant opposite: #parentEnum',
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #enumDeclarations'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaEnumDeclaration class >> annotation [

	<FMClass: #EnumDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTJavaEnumDeclaration >> addConstant: anObject [
	<generated>
	^ self constants add: anObject
]

{ #category : #adding }
FASTJavaEnumDeclaration >> addInterface: anObject [
	<generated>
	^ self interfaces add: anObject
]

{ #category : #accessing }
FASTJavaEnumDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #enumDeclarations"

	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	^ compilationUnit
]

{ #category : #accessing }
FASTJavaEnumDeclaration >> compilationUnit: anObject [

	<generated>
	compilationUnit := anObject
]

{ #category : #navigation }
FASTJavaEnumDeclaration >> compilationUnitGroup [
	<generated>
	<navigation: 'CompilationUnit'>
	^ MooseSpecializedGroup with: self compilationUnit
]

{ #category : #accessing }
FASTJavaEnumDeclaration >> constants [
	"Relation named: #constants type: #FASTJavaEnumConstant opposite: #parentEnum"

	<generated>
	<FMComment: 'The constants I define'>
	<derived>
	^ constants
]

{ #category : #accessing }
FASTJavaEnumDeclaration >> constants: anObject [

	<generated>
	constants value: anObject
]

{ #category : #navigation }
FASTJavaEnumDeclaration >> constantsGroup [
	<generated>
	<navigation: 'Constants'>
	^ MooseSpecializedGroup withAll: self constants asSet
]

{ #category : #accessing }
FASTJavaEnumDeclaration >> interfaces [
	"Relation named: #interfaces type: #FASTJavaTypeExpression opposite: #javaEnumDeclarationInterfaceOwner"

	<generated>
	<FMComment: 'The interfaces I implement'>
	<derived>
	^ interfaces
]

{ #category : #accessing }
FASTJavaEnumDeclaration >> interfaces: anObject [

	<generated>
	interfaces value: anObject
]

{ #category : #navigation }
FASTJavaEnumDeclaration >> interfacesGroup [
	<generated>
	<navigation: 'Interfaces'>
	^ MooseSpecializedGroup withAll: self interfaces asSet
]
