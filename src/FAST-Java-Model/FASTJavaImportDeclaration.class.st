"
I represent an import declaration, e.g. `import java.util.List;`

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FASTJavaImportDeclaration` | `importDeclarations` | `FASTJavaCompilationUnit` | The compilation unit that owns me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `qualifiedName` | `FASTJavaTWithQualifiedName` | `qualifiedNameOwner` | `FASTJavaQualifiedName` | The name that qualifies me|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `isModule` | `Boolean` | false | Whether this import names a module rather than a type, as `import module java.base;` does (JLS 7.5.5)|
| `isOnDemand` | `Boolean` | false | Whether this import is on-demand (wildcard) or single-type|
| `isStatic` | `Boolean` | false | True if importing static members|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaImportDeclaration',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTWithQualifiedName + FASTTEntity',
	#classTraits : 'FASTJavaTWithQualifiedName classTrait + FASTTEntity classTrait',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #importDeclarations',
		'#isModule => FMProperty defaultValue: false',
		'#isOnDemand => FMProperty defaultValue: false',
		'#isStatic => FMProperty defaultValue: false'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaImportDeclaration class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ImportDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #importDeclarations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	^ compilationUnit
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> compilationUnit: anObject [

	<ignoreForCoverage>
	<generated>
	compilationUnit := anObject
]

{ #category : 'testing' }
FASTJavaImportDeclaration >> isImportDeclaration [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> isModule [

	<FMProperty: #isModule type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Whether this import names a module rather than a type, as `import module java.base;` does (JLS 7.5.5)'>
	^ isModule ifNil: [ isModule := false ]
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> isModule: anObject [
	<ignoreForCoverage>
	<generated>
	isModule := anObject
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> isOnDemand [

	<FMProperty: #isOnDemand type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Whether this import is on-demand (wildcard) or single-type'>
	^ isOnDemand ifNil: [ isOnDemand := false ]
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> isOnDemand: anObject [
	<ignoreForCoverage>
	<generated>
	isOnDemand := anObject
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> isStatic [

	<FMProperty: #isStatic type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'True if importing static members'>
	^ isStatic ifNil: [ isStatic := false ]
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> isStatic: anObject [
	<ignoreForCoverage>
	<generated>
	isStatic := anObject
]
