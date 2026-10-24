"
I represent an enum declaration
example

public enum MyEnum {
	
	HELLO;
	
	int oneDeclaration;
	
	void methodDeclaration(){
	}
}

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FASTJavaEnumDeclaration` | `enumDeclarations` | `FASTJavaCompilationUnit` | The compilation unit that owns me|
| `forIncrementorOwner` | `FASTTStatement` | `incrementors` | `FASTJavaForStatement` | I am an incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializers` | `FASTJavaForStatement` | I am an initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `javaDeclarationOwner` | `FASTJavaTDeclaration` | `declarations` | `FASTJavaTWithDeclarations` | The element that declares me|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `constants` | `FASTJavaEnumDeclaration` | `parentEnum` | `FASTJavaEnumConstant` | The constants I define|
| `declarations` | `FASTJavaTWithDeclarations` | `javaDeclarationOwner` | `FASTJavaTDeclaration` | The elements I declare|
| `interfaces` | `FASTJavaEnumDeclaration` | `javaEnumDeclarationInterfaceOwner` | `FASTJavaTypeExpression` | The interfaces I implement|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaTModifier` | My modifiers|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `source` | `String` | nil | Actual source code of the source entity|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaEnumDeclaration',
	#superclass : 'FASTJavaEntity',
	#traits : '(FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithModifiers + FASTTNamedEntity + FASTTStatement + FamixTHasImmediateSource withPrecedenceOf: FamixTHasImmediateSource)',
	#classTraits : '(FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithModifiers classTrait + FASTTNamedEntity classTrait + FASTTStatement classTrait + FamixTHasImmediateSource classTrait withPrecedenceOf: FamixTHasImmediateSource classTrait)',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #enumDeclarations',
		'#constants => FMMany type: #FASTJavaEnumConstant opposite: #parentEnum',
		'#interfaces => FMMany type: #FASTJavaTypeExpression opposite: #javaEnumDeclarationInterfaceOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaEnumDeclaration class >> annotation [

	<ignoreForCoverage>
	<FMClass: #EnumDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaEnumDeclaration >> addConstant: anObject [

	<ignoreForCoverage>
	<generated>
	^ self constants add: anObject
]

{ #category : 'adding' }
FASTJavaEnumDeclaration >> addInterface: anObject [

	<ignoreForCoverage>
	<generated>
	^ self interfaces add: anObject
]

{ #category : 'accessing' }
FASTJavaEnumDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #enumDeclarations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	^ compilationUnit
]

{ #category : 'accessing' }
FASTJavaEnumDeclaration >> compilationUnit: anObject [

	<ignoreForCoverage>
	<generated>
	compilationUnit := anObject
]

{ #category : 'accessing' }
FASTJavaEnumDeclaration >> constants [
	"Relation named: #constants type: #FASTJavaEnumConstant opposite: #parentEnum"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The constants I define'>
	<derived>
	^ constants
]

{ #category : 'accessing' }
FASTJavaEnumDeclaration >> constants: anObject [

	<ignoreForCoverage>
	<generated>
	constants value: anObject
]

{ #category : 'accessing' }
FASTJavaEnumDeclaration >> interfaces [
	"Relation named: #interfaces type: #FASTJavaTypeExpression opposite: #javaEnumDeclarationInterfaceOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The interfaces I implement'>
	<derived>
	^ interfaces
]

{ #category : 'accessing' }
FASTJavaEnumDeclaration >> interfaces: anObject [

	<ignoreForCoverage>
	<generated>
	interfaces value: anObject
]

{ #category : 'testing' }
FASTJavaEnumDeclaration >> isEnumDeclaration [

	<ignoreForCoverage>
	<generated>
	^ true
]
