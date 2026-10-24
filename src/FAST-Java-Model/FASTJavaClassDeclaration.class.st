"
I represent a class declaration
example

public class ClassName extends SomeClass implements OneClass, TwoClass {

	int oneDeclaration;
	
	void methodDeclaration(){
	}
}

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FASTJavaClassDeclaration` | `classDeclarations` | `FASTJavaCompilationUnit` | The compilation unit that owns me|
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
| `declarations` | `FASTJavaTWithDeclarations` | `javaDeclarationOwner` | `FASTJavaTDeclaration` | The elements I declare|
| `interfaces` | `FASTJavaClassDeclaration` | `javaClassDeclarationInterfaceOwner` | `FASTJavaTypeExpression` | The interfaces I implement|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaTModifier` | My modifiers|
| `superclass` | `FASTJavaClassDeclaration` | `javaClassDeclarationSuperclassOwner` | `FASTJavaTypeExpression` | My superclass|
| `typeParameters` | `FASTJavaTWithTypeParameters` | `javaTypeParameterOwner` | `FASTJavaTypeParameterExpression` | The type parameters I declare|

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
	#name : 'FASTJavaClassDeclaration',
	#superclass : 'FASTJavaEntity',
	#traits : '(FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithModifiers + FASTJavaTWithTypeParameters + FASTTNamedEntity + FASTTStatement + FamixTHasImmediateSource withPrecedenceOf: FamixTHasImmediateSource)',
	#classTraits : '(FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithModifiers classTrait + FASTJavaTWithTypeParameters classTrait + FASTTNamedEntity classTrait + FASTTStatement classTrait + FamixTHasImmediateSource classTrait withPrecedenceOf: FamixTHasImmediateSource classTrait)',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #classDeclarations',
		'#interfaces => FMMany type: #FASTJavaTypeExpression opposite: #javaClassDeclarationInterfaceOwner',
		'#superclass => FMOne type: #FASTJavaTypeExpression opposite: #javaClassDeclarationSuperclassOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaClassDeclaration class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ClassDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaClassDeclaration >> addInterface: anObject [

	<ignoreForCoverage>
	<generated>
	^ self interfaces add: anObject
]

{ #category : 'accessing' }
FASTJavaClassDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #classDeclarations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	^ compilationUnit
]

{ #category : 'accessing' }
FASTJavaClassDeclaration >> compilationUnit: anObject [

	<ignoreForCoverage>
	<generated>
	compilationUnit := anObject
]

{ #category : 'accessing' }
FASTJavaClassDeclaration >> interfaces [
	"Relation named: #interfaces type: #FASTJavaTypeExpression opposite: #javaClassDeclarationInterfaceOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The interfaces I implement'>
	<derived>
	^ interfaces
]

{ #category : 'accessing' }
FASTJavaClassDeclaration >> interfaces: anObject [

	<ignoreForCoverage>
	<generated>
	interfaces value: anObject
]

{ #category : 'testing' }
FASTJavaClassDeclaration >> isClassDeclaration [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaClassDeclaration >> superclass [
	"Relation named: #superclass type: #FASTJavaTypeExpression opposite: #javaClassDeclarationSuperclassOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'My superclass'>
	^ superclass
]

{ #category : 'accessing' }
FASTJavaClassDeclaration >> superclass: anObject [

	<ignoreForCoverage>
	<generated>
	superclass := anObject
]
