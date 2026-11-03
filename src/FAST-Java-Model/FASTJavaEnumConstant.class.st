"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `parentEnum` | `FASTJavaEnumConstant` | `constants` | `FASTJavaEnumDeclaration` | The enum type that contains me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotations` | `FASTJavaTWithAnnotations` | `javaAnnotationOwner` | `FASTJavaAnnotation` | The annotations written on me|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|
| `declarations` | `FASTJavaTWithDeclarations` | `javaDeclarationOwner` | `FASTJavaTDeclaration` | The elements I declare|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaEnumConstant',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTWithAnnotations + FASTJavaTWithDeclarations + FASTTNamedEntity + FASTTWithArguments',
	#classTraits : 'FASTJavaTWithAnnotations classTrait + FASTJavaTWithDeclarations classTrait + FASTTNamedEntity classTrait + FASTTWithArguments classTrait',
	#instVars : [
		'#parentEnum => FMOne type: #FASTJavaEnumDeclaration opposite: #constants'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaEnumConstant class >> annotation [

	<ignoreForCoverage>
	<FMClass: #EnumConstant super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaEnumConstant >> isEnumConstant [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaEnumConstant >> parentEnum [
	"Relation named: #parentEnum type: #FASTJavaEnumDeclaration opposite: #constants"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The enum type that contains me'>
	<container>
	^ parentEnum
]

{ #category : 'accessing' }
FASTJavaEnumConstant >> parentEnum: anObject [

	<ignoreForCoverage>
	<generated>
	parentEnum := anObject
]
