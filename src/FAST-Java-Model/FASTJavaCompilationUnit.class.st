"
I represent a compilation unit, I can contain declarations for a package, imports, and types

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotationInterfaceDeclarations` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaAnnotationInterfaceDeclaration` | My annotation interface declarations|
| `classDeclarations` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaClassDeclaration` | My class declarations|
| `enumDeclarations` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaEnumDeclaration` | My enum declaration|
| `fieldDeclarations` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaVarDeclStatement` | The fields a compact compilation unit writes at the top level|
| `importDeclarations` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaImportDeclaration` | My import declarations|
| `interfaceDeclarations` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaInterfaceDeclaration` | My interface declarations|
| `methodDeclarations` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaMethodEntity` | The methods a compact compilation unit writes at the top level|
| `moduleDeclaration` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaModuleDeclaration` | The module a modular compilation unit declares|
| `packageDeclaration` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaPackageDeclaration` | My package declaration, or nil for the default package|
| `recordDeclarations` | `FASTJavaCompilationUnit` | `compilationUnit` | `FASTJavaRecordDeclaration` | My record declarations|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `source` | `String` | nil | Actual source code of the source entity|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaCompilationUnit',
	#superclass : 'FASTJavaEntity',
	#traits : '(FASTTEntity + FamixTHasImmediateSource withPrecedenceOf: FamixTHasImmediateSource)',
	#classTraits : '(FASTTEntity classTrait + FamixTHasImmediateSource classTrait withPrecedenceOf: FamixTHasImmediateSource classTrait)',
	#instVars : [
		'#annotationInterfaceDeclarations => FMMany type: #FASTJavaAnnotationInterfaceDeclaration opposite: #compilationUnit',
		'#classDeclarations => FMMany type: #FASTJavaClassDeclaration opposite: #compilationUnit',
		'#enumDeclarations => FMMany type: #FASTJavaEnumDeclaration opposite: #compilationUnit',
		'#fieldDeclarations => FMMany type: #FASTJavaVarDeclStatement opposite: #compilationUnit',
		'#importDeclarations => FMMany type: #FASTJavaImportDeclaration opposite: #compilationUnit',
		'#interfaceDeclarations => FMMany type: #FASTJavaInterfaceDeclaration opposite: #compilationUnit',
		'#methodDeclarations => FMMany type: #FASTJavaMethodEntity opposite: #compilationUnit',
		'#moduleDeclaration => FMOne type: #FASTJavaModuleDeclaration opposite: #compilationUnit',
		'#packageDeclaration => FMOne type: #FASTJavaPackageDeclaration opposite: #compilationUnit',
		'#recordDeclarations => FMMany type: #FASTJavaRecordDeclaration opposite: #compilationUnit'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaCompilationUnit class >> annotation [

	<ignoreForCoverage>
	<FMClass: #CompilationUnit super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaCompilationUnit >> addAnnotationInterfaceDeclaration: anObject [

	<ignoreForCoverage>
	<generated>
	^ self annotationInterfaceDeclarations add: anObject
]

{ #category : 'adding' }
FASTJavaCompilationUnit >> addClassDeclaration: anObject [

	<ignoreForCoverage>
	<generated>
	^ self classDeclarations add: anObject
]

{ #category : 'adding' }
FASTJavaCompilationUnit >> addEnumDeclaration: anObject [

	<ignoreForCoverage>
	<generated>
	^ self enumDeclarations add: anObject
]

{ #category : 'adding' }
FASTJavaCompilationUnit >> addFieldDeclaration: anObject [

	<ignoreForCoverage>
	<generated>
	^ self fieldDeclarations add: anObject
]

{ #category : 'adding' }
FASTJavaCompilationUnit >> addImportDeclaration: anObject [

	<ignoreForCoverage>
	<generated>
	^ self importDeclarations add: anObject
]

{ #category : 'adding' }
FASTJavaCompilationUnit >> addInterfaceDeclaration: anObject [

	<ignoreForCoverage>
	<generated>
	^ self interfaceDeclarations add: anObject
]

{ #category : 'adding' }
FASTJavaCompilationUnit >> addMethodDeclaration: anObject [

	<ignoreForCoverage>
	<generated>
	^ self methodDeclarations add: anObject
]

{ #category : 'adding' }
FASTJavaCompilationUnit >> addRecordDeclaration: anObject [

	<ignoreForCoverage>
	<generated>
	^ self recordDeclarations add: anObject
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> annotationInterfaceDeclarations [
	"Relation named: #annotationInterfaceDeclarations type: #FASTJavaAnnotationInterfaceDeclaration opposite: #compilationUnit"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'My annotation interface declarations'>
	<derived>
	^ annotationInterfaceDeclarations
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> annotationInterfaceDeclarations: anObject [

	<ignoreForCoverage>
	<generated>
	annotationInterfaceDeclarations value: anObject
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> classDeclarations [
	"Relation named: #classDeclarations type: #FASTJavaClassDeclaration opposite: #compilationUnit"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'My class declarations'>
	<derived>
	^ classDeclarations
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> classDeclarations: anObject [

	<ignoreForCoverage>
	<generated>
	classDeclarations value: anObject
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> enumDeclarations [
	"Relation named: #enumDeclarations type: #FASTJavaEnumDeclaration opposite: #compilationUnit"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'My enum declaration'>
	<derived>
	^ enumDeclarations
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> enumDeclarations: anObject [

	<ignoreForCoverage>
	<generated>
	enumDeclarations value: anObject
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> fieldDeclarations [
	"Relation named: #fieldDeclarations type: #FASTJavaVarDeclStatement opposite: #compilationUnit"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The fields a compact compilation unit writes at the top level'>
	<derived>
	^ fieldDeclarations
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> fieldDeclarations: anObject [

	<ignoreForCoverage>
	<generated>
	fieldDeclarations value: anObject
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> importDeclarations [
	"Relation named: #importDeclarations type: #FASTJavaImportDeclaration opposite: #compilationUnit"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'My import declarations'>
	<derived>
	^ importDeclarations
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> importDeclarations: anObject [

	<ignoreForCoverage>
	<generated>
	importDeclarations value: anObject
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> interfaceDeclarations [
	"Relation named: #interfaceDeclarations type: #FASTJavaInterfaceDeclaration opposite: #compilationUnit"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'My interface declarations'>
	<derived>
	^ interfaceDeclarations
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> interfaceDeclarations: anObject [

	<ignoreForCoverage>
	<generated>
	interfaceDeclarations value: anObject
]

{ #category : 'testing' }
FASTJavaCompilationUnit >> isCompilationUnit [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> methodDeclarations [
	"Relation named: #methodDeclarations type: #FASTJavaMethodEntity opposite: #compilationUnit"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The methods a compact compilation unit writes at the top level'>
	<derived>
	^ methodDeclarations
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> methodDeclarations: anObject [

	<ignoreForCoverage>
	<generated>
	methodDeclarations value: anObject
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> moduleDeclaration [
	"Relation named: #moduleDeclaration type: #FASTJavaModuleDeclaration opposite: #compilationUnit"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The module a modular compilation unit declares'>
	^ moduleDeclaration
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> moduleDeclaration: anObject [

	<ignoreForCoverage>
	<generated>
	moduleDeclaration := anObject
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> packageDeclaration [
	"Relation named: #packageDeclaration type: #FASTJavaPackageDeclaration opposite: #compilationUnit"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'My package declaration, or nil for the default package'>
	^ packageDeclaration
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> packageDeclaration: anObject [

	<ignoreForCoverage>
	<generated>
	packageDeclaration := anObject
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> recordDeclarations [
	"Relation named: #recordDeclarations type: #FASTJavaRecordDeclaration opposite: #compilationUnit"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'My record declarations'>
	<derived>
	^ recordDeclarations
]

{ #category : 'accessing' }
FASTJavaCompilationUnit >> recordDeclarations: anObject [

	<ignoreForCoverage>
	<generated>
	recordDeclarations value: anObject
]
