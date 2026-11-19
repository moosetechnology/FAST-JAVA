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
| `hasClassBody` | `Boolean` | false | Whether this constant writes a class body, even an empty one, which makes it the instance of an anonymous class extending its enum (JLS 8.9.1)|
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaEnumConstant',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTWithAnnotations + FASTJavaTWithDeclarations + FASTTNamedEntity + FASTTWithArguments',
	#classTraits : 'FASTJavaTWithAnnotations classTrait + FASTJavaTWithDeclarations classTrait + FASTTNamedEntity classTrait + FASTTWithArguments classTrait',
	#instVars : [
		'#hasClassBody => FMProperty defaultValue: false',
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

{ #category : 'accessing' }
FASTJavaEnumConstant >> hasClassBody [

	<FMProperty: #hasClassBody type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Whether this constant writes a class body, even an empty one, which makes it the instance of an anonymous class extending its enum (JLS 8.9.1)'>
	^ hasClassBody ifNil: [ hasClassBody := false ]
]

{ #category : 'accessing' }
FASTJavaEnumConstant >> hasClassBody: anObject [
	<ignoreForCoverage>
	<generated>
	hasClassBody := anObject
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
