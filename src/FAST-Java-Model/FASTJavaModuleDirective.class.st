"
I am one directive of a module declaration (JLS 7.7.1), and I name the module, package or service I am about.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `moduleDeclaration` | `FASTJavaModuleDirective` | `directives` | `FASTJavaModuleDeclaration` | The module declaration that owns me|

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
	#name : 'FASTJavaModuleDirective',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTWithQualifiedName + FASTTEntity',
	#classTraits : 'FASTJavaTWithQualifiedName classTrait + FASTTEntity classTrait',
	#instVars : [
		'#moduleDeclaration => FMOne type: #FASTJavaModuleDeclaration opposite: #directives'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaModuleDirective class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ModuleDirective super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaModuleDirective >> isModuleDirective [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaModuleDirective >> moduleDeclaration [
	"Relation named: #moduleDeclaration type: #FASTJavaModuleDeclaration opposite: #directives"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The module declaration that owns me'>
	<container>
	^ moduleDeclaration
]

{ #category : 'accessing' }
FASTJavaModuleDirective >> moduleDeclaration: anObject [

	<ignoreForCoverage>
	<generated>
	moduleDeclaration := anObject
]
