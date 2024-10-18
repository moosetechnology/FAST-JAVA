"
I represent a package declaration, e.g. `package fr.inria;`

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FASTJavaPackageDeclaration` | `packageDeclaration` | `FASTJavaCompilationUnit` | The compilation unit that owns me|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `qualifiedName` | `FASTJavaTWithQualifiedName` | `qualifiedNameOwner` | `FASTJavaQualifiedName` | The name that qualifies me|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaPackageDeclaration',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTWithQualifiedName + FASTTEntity',
	#classTraits : 'FASTJavaTWithQualifiedName classTrait + FASTTEntity classTrait',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #packageDeclaration'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaPackageDeclaration class >> annotation [

	<FMClass: #PackageDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaPackageDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #packageDeclaration"

	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	<derived>
	^ compilationUnit
]

{ #category : 'accessing' }
FASTJavaPackageDeclaration >> compilationUnit: anObject [

	<generated>
	compilationUnit := anObject
]

{ #category : 'navigation' }
FASTJavaPackageDeclaration >> compilationUnitGroup [
	<generated>
	<navigation: 'CompilationUnit'>
	^ MooseSpecializedGroup with: self compilationUnit
]
