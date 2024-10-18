"
I represent an import declaration, e.g. `import java.util.List;`

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FASTJavaImportDeclaration` | `importDeclarations` | `FASTJavaCompilationUnit` | The compilation unit that owns me|
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
		'#isStatic => FMProperty defaultValue: false',
		'#isOnDemand => FMProperty defaultValue: false',
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #importDeclarations'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaImportDeclaration class >> annotation [

	<FMClass: #ImportDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #importDeclarations"

	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	^ compilationUnit
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> compilationUnit: anObject [

	<generated>
	compilationUnit := anObject
]

{ #category : 'navigation' }
FASTJavaImportDeclaration >> compilationUnitGroup [
	<generated>
	<navigation: 'CompilationUnit'>
	^ MooseSpecializedGroup with: self compilationUnit
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> isOnDemand [

	<FMProperty: #isOnDemand type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Whether this import is on-demand (wildcard) or single-type'>
	^ isOnDemand ifNil: [ isOnDemand := false ]
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> isOnDemand: anObject [
	<generated>
	isOnDemand := anObject
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> isStatic [

	<FMProperty: #isStatic type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'True if importing static members'>
	^ isStatic ifNil: [ isStatic := false ]
]

{ #category : 'accessing' }
FASTJavaImportDeclaration >> isStatic: anObject [
	<generated>
	isStatic := anObject
]
