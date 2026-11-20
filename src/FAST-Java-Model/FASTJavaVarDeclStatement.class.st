"
A statement of variable declaration.
A variable declaration statement can contain several declarators.

e.g.

int d = 3, e, f = 5;
statement has 3 declarators separated by commas. Second declarator has no expression.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FASTJavaVarDeclStatement` | `fieldDeclarations` | `FASTJavaCompilationUnit` | The compilation unit that owns me|
| `forIncrementorOwner` | `FASTTStatement` | `incrementors` | `FASTJavaForStatement` | I am an incrementor of the for|
| `forInitializerOwner` | `FASTTStatement` | `initializers` | `FASTJavaForStatement` | I am an initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `javaDeclarationOwner` | `FASTJavaTDeclaration` | `declarations` | `FASTJavaTWithDeclarations` | The element that declares me|
| `javaTryResourceOwner` | `FASTJavaTTryResource` | `resources` | `FASTJavaTryCatchStatement` | The try-with-resource that owns me|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotations` | `FASTJavaTWithAnnotations` | `javaAnnotationOwner` | `FASTJavaAnnotation` | The annotations written on me|
| `declarators` | `FASTJavaVarDeclStatement` | `varDeclOwner` | `FASTJavaVariableDeclarator` | The declarators for the type|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaModifier` | The keywords I write|
| `type` | `FASTJavaVarDeclStatement` | `javaVarDeclTypeOwner` | `FASTJavaTypeExpression` | The type of the declared variables|


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
	#traits : 'FASTJavaTDeclaration + FASTJavaTTryResource + FASTJavaTWithAnnotations + FASTJavaTWithModifiers + FASTTScopableEntity + FASTTStatement',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTTryResource classTrait + FASTJavaTWithAnnotations classTrait + FASTJavaTWithModifiers classTrait + FASTTScopableEntity classTrait + FASTTStatement classTrait',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #fieldDeclarations',
		'#declarators => FMMany type: #FASTJavaVariableDeclarator opposite: #varDeclOwner',
		'#type => FMOne type: #FASTJavaTypeExpression opposite: #javaVarDeclTypeOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaVarDeclStatement class >> annotation [

	<ignoreForCoverage>
	<FMClass: #VarDeclStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaVarDeclStatement >> addDeclarator: anObject [

	<ignoreForCoverage>
	<generated>
	^ self declarators add: anObject
]

{ #category : 'accessing' }
FASTJavaVarDeclStatement >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #fieldDeclarations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	^ compilationUnit
]

{ #category : 'accessing' }
FASTJavaVarDeclStatement >> compilationUnit: anObject [

	<ignoreForCoverage>
	<generated>
	compilationUnit := anObject
]

{ #category : 'accessing' }
FASTJavaVarDeclStatement >> declarators [
	"Relation named: #declarators type: #FASTJavaVariableDeclarator opposite: #varDeclOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The declarators for the type'>
	<derived>
	^ declarators
]

{ #category : 'accessing' }
FASTJavaVarDeclStatement >> declarators: anObject [

	<ignoreForCoverage>
	<generated>
	declarators value: anObject
]

{ #category : 'testing' }
FASTJavaVarDeclStatement >> isVarDeclStatement [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaVarDeclStatement >> type [
	"Relation named: #type type: #FASTJavaTypeExpression opposite: #javaVarDeclTypeOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The type of the declared variables'>
	^ type
]

{ #category : 'accessing' }
FASTJavaVarDeclStatement >> type: anObject [

	<ignoreForCoverage>
	<generated>
	type := anObject
]
