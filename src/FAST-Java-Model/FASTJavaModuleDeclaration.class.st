"
I am the module a modular compilation unit declares (JLS 7.7), and I hold the directives it writes.

```language=text
module com.example.app { requires java.logging; }
```

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FASTJavaModuleDeclaration` | `moduleDeclaration` | `FASTJavaCompilationUnit` | The compilation unit that owns me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `directives` | `FASTJavaModuleDeclaration` | `moduleDeclaration` | `FASTJavaModuleDirective` | The directives I write, in the order I write them|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaTModifier` | My modifiers|
| `qualifiedName` | `FASTJavaTWithQualifiedName` | `qualifiedNameOwner` | `FASTJavaQualifiedName` | The name that qualifies me|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `isOpen` | `Boolean` | false | Whether this module writes `open`, which opens every one of its packages to reflection (JLS 7.7)|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaModuleDeclaration',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTWithModifiers + FASTJavaTWithQualifiedName + FASTTEntity',
	#classTraits : 'FASTJavaTWithModifiers classTrait + FASTJavaTWithQualifiedName classTrait + FASTTEntity classTrait',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #moduleDeclaration',
		'#directives => FMMany type: #FASTJavaModuleDirective opposite: #moduleDeclaration',
		'#isOpen => FMProperty defaultValue: false'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaModuleDeclaration class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ModuleDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaModuleDeclaration >> addDirective: anObject [

	<ignoreForCoverage>
	<generated>
	^ self directives add: anObject
]

{ #category : 'accessing' }
FASTJavaModuleDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #moduleDeclaration"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	<derived>
	^ compilationUnit
]

{ #category : 'accessing' }
FASTJavaModuleDeclaration >> compilationUnit: anObject [

	<ignoreForCoverage>
	<generated>
	compilationUnit := anObject
]

{ #category : 'accessing' }
FASTJavaModuleDeclaration >> directives [
	"Relation named: #directives type: #FASTJavaModuleDirective opposite: #moduleDeclaration"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The directives I write, in the order I write them'>
	<derived>
	^ directives
]

{ #category : 'accessing' }
FASTJavaModuleDeclaration >> directives: anObject [

	<ignoreForCoverage>
	<generated>
	directives value: anObject
]

{ #category : 'testing' }
FASTJavaModuleDeclaration >> isModuleDeclaration [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaModuleDeclaration >> isOpen [

	<FMProperty: #isOpen type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Whether this module writes `open`, which opens every one of its packages to reflection (JLS 7.7)'>
	^ isOpen ifNil: [ isOpen := false ]
]

{ #category : 'accessing' }
FASTJavaModuleDeclaration >> isOpen: anObject [
	<ignoreForCoverage>
	<generated>
	isOpen := anObject
]
