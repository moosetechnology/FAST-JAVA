"
A statement of variable declaration.
A variable declaration statement can contain several declarators.

eg.

int d = 3, e, f = 5;
statement has 3 declarators separated by commas. Second declarator has no expression.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `doBodyOwner` | `FASTTStatement` | `body` | `FASTJavaDoWhileStatement` | I am the body of the do|
| `forBodyOwner` | `FASTTStatement` | `body` | `FASTJavaForStatement` | I am the body of the for|
| `forIncrementorOwner` | `FASTTStatement` | `incrementor` | `FASTJavaForStatement` | I am the incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializer` | `FASTJavaForStatement` | I am the initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `javaDeclarationOwner` | `FASTJavaTDeclaration` | `declarations` | `FASTJavaTWithDeclarations` | The element that declares me|
| `javaForEachStatementOwner` | `FASTTStatement` | `body` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `javaTryResourceOwner` | `FASTJavaVarDeclStatement` | `resources` | `FASTJavaTryCatchStatement` | The try-with-resource that owns me|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|
| `whileBodyOwner` | `FASTTStatement` | `body` | `FASTJavaWhileStatement` | I am the body of the do|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declarators` | `FASTJavaVarDeclStatement` | `varDeclOwner` | `FASTJavaVariableDeclarator` | The declarators for the type|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaTModifier` | My modifiers|
| `type` | `FASTJavaVarDeclStatement` | `javaVarDeclTypeOwner` | `FASTJavaVariableExpression` | The type of the declared variables|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaVarDeclStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithModifiers + FASTTScopableEntity + FASTTStatement',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithModifiers classTrait + FASTTScopableEntity classTrait + FASTTStatement classTrait',
	#instVars : [
		'#declarators => FMMany type: #FASTJavaVariableDeclarator opposite: #varDeclOwner',
		'#javaTryResourceOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #resources',
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaVarDeclTypeOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaVarDeclStatement class >> annotation [

	<FMClass: #VarDeclStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTJavaVarDeclStatement >> addDeclarator: anObject [
	<generated>
	^ self declarators add: anObject
]

{ #category : 'accessing' }
FASTJavaVarDeclStatement >> declarators [
	"Relation named: #declarators type: #FASTJavaVariableDeclarator opposite: #varDeclOwner"

	<generated>
	<FMComment: 'The declarators for the type'>
	<derived>
	^ declarators
]

{ #category : 'accessing' }
FASTJavaVarDeclStatement >> declarators: anObject [

	<generated>
	declarators value: anObject
]

{ #category : 'navigation' }
FASTJavaVarDeclStatement >> declaratorsGroup [
	<generated>
	<navigation: 'Declarators'>
	^ MooseSpecializedGroup withAll: self declarators asSet
]

{ #category : 'accessing' }
FASTJavaVarDeclStatement >> javaTryResourceOwner [
	"Relation named: #javaTryResourceOwner type: #FASTJavaTryCatchStatement opposite: #resources"

	<generated>
	<FMComment: 'The try-with-resource that owns me'>
	<container>
	^ javaTryResourceOwner
]

{ #category : 'accessing' }
FASTJavaVarDeclStatement >> javaTryResourceOwner: anObject [

	<generated>
	javaTryResourceOwner := anObject
]

{ #category : 'navigation' }
FASTJavaVarDeclStatement >> javaTryResourceOwnerGroup [
	<generated>
	<navigation: 'JavaTryResourceOwner'>
	^ MooseSpecializedGroup with: self javaTryResourceOwner
]

{ #category : 'accessing' }
FASTJavaVarDeclStatement >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaVarDeclTypeOwner"

	<generated>
	<FMComment: 'The type of the declared variables'>
	^ type
]

{ #category : 'accessing' }
FASTJavaVarDeclStatement >> type: anObject [

	<generated>
	type := anObject
]

{ #category : 'navigation' }
FASTJavaVarDeclStatement >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
