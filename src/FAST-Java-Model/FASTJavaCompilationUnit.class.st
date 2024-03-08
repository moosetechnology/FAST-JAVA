"
I represent a compilation unit, I can contain declarations for a package, imports, and types

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `classDeclarations` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaClassDeclaration` | My class declarations|
| `enumDeclarations` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaEnumDeclaration` | My enum declaration|
| `importDeclarations` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaImportDeclaration` | My import declarations|
| `interfaceDeclarations` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaInterfaceDeclaration` | My interface declarations|
| `packageDeclaration` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaPackageDeclaration` | My package declaration, or nil for the default package|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaCompilationUnit,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#instVars : [
		'#packageDeclaration => FMOne type: #FASTJavaPackageDeclaration opposite: #compilationUnit',
		'#importDeclarations => FMMany type: #FASTJavaImportDeclaration opposite: #compilationUnit',
		'#classDeclarations => FMMany type: #FASTJavaClassDeclaration opposite: #compilationUnit',
		'#interfaceDeclarations => FMMany type: #FASTJavaInterfaceDeclaration opposite: #compilationUnit',
		'#enumDeclarations => FMMany type: #FASTJavaEnumDeclaration opposite: #compilationUnit'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaCompilationUnit class >> annotation [

	<FMClass: #CompilationUnit super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTJavaCompilationUnit >> addClassDeclaration: anObject [
	<generated>
	^ self classDeclarations add: anObject
]

{ #category : #adding }
FASTJavaCompilationUnit >> addEnumDeclaration: anObject [
	<generated>
	^ self enumDeclarations add: anObject
]

{ #category : #adding }
FASTJavaCompilationUnit >> addImportDeclaration: anObject [
	<generated>
	^ self importDeclarations add: anObject
]

{ #category : #adding }
FASTJavaCompilationUnit >> addInterfaceDeclaration: anObject [
	<generated>
	^ self interfaceDeclarations add: anObject
]

{ #category : #accessing }
FASTJavaCompilationUnit >> classDeclarations [
	"Relation named: #classDeclarations type: #FASTJavaClassDeclaration opposite: #compilationUnit"

	<generated>
	<FMComment: 'My class declarations'>
	<derived>
	^ classDeclarations
]

{ #category : #accessing }
FASTJavaCompilationUnit >> classDeclarations: anObject [

	<generated>
	classDeclarations value: anObject
]

{ #category : #navigation }
FASTJavaCompilationUnit >> classDeclarationsGroup [
	<generated>
	<navigation: 'ClassDeclarations'>
	^ MooseSpecializedGroup withAll: self classDeclarations asSet
]

{ #category : #accessing }
FASTJavaCompilationUnit >> enumDeclarations [
	"Relation named: #enumDeclarations type: #FASTJavaEnumDeclaration opposite: #compilationUnit"

	<generated>
	<FMComment: 'My enum declaration'>
	<derived>
	^ enumDeclarations
]

{ #category : #accessing }
FASTJavaCompilationUnit >> enumDeclarations: anObject [

	<generated>
	enumDeclarations value: anObject
]

{ #category : #navigation }
FASTJavaCompilationUnit >> enumDeclarationsGroup [
	<generated>
	<navigation: 'EnumDeclarations'>
	^ MooseSpecializedGroup withAll: self enumDeclarations asSet
]

{ #category : #accessing }
FASTJavaCompilationUnit >> importDeclarations [
	"Relation named: #importDeclarations type: #FASTJavaImportDeclaration opposite: #compilationUnit"

	<generated>
	<FMComment: 'My import declarations'>
	<derived>
	^ importDeclarations
]

{ #category : #accessing }
FASTJavaCompilationUnit >> importDeclarations: anObject [

	<generated>
	importDeclarations value: anObject
]

{ #category : #navigation }
FASTJavaCompilationUnit >> importDeclarationsGroup [
	<generated>
	<navigation: 'ImportDeclarations'>
	^ MooseSpecializedGroup withAll: self importDeclarations asSet
]

{ #category : #accessing }
FASTJavaCompilationUnit >> interfaceDeclarations [
	"Relation named: #interfaceDeclarations type: #FASTJavaInterfaceDeclaration opposite: #compilationUnit"

	<generated>
	<FMComment: 'My interface declarations'>
	<derived>
	^ interfaceDeclarations
]

{ #category : #accessing }
FASTJavaCompilationUnit >> interfaceDeclarations: anObject [

	<generated>
	interfaceDeclarations value: anObject
]

{ #category : #navigation }
FASTJavaCompilationUnit >> interfaceDeclarationsGroup [
	<generated>
	<navigation: 'InterfaceDeclarations'>
	^ MooseSpecializedGroup withAll: self interfaceDeclarations asSet
]

{ #category : #accessing }
FASTJavaCompilationUnit >> packageDeclaration [
	"Relation named: #packageDeclaration type: #FASTJavaPackageDeclaration opposite: #compilationUnit"

	<generated>
	<FMComment: 'My package declaration, or nil for the default package'>
	^ packageDeclaration
]

{ #category : #accessing }
FASTJavaCompilationUnit >> packageDeclaration: anObject [

	<generated>
	packageDeclaration := anObject
]

{ #category : #navigation }
FASTJavaCompilationUnit >> packageDeclarationGroup [
	<generated>
	<navigation: 'PackageDeclaration'>
	^ MooseSpecializedGroup with: self packageDeclaration
]
