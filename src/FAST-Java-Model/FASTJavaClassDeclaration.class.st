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
| `doBodyOwner` | `FASTTStatement` | `body` | `FASTJavaDoWhileStatement` | I am the body of the do|
| `forBodyOwner` | `FASTTStatement` | `body` | `FASTJavaForStatement` | I am the body of the for|
| `forIncrementorOwner` | `FASTTStatement` | `incrementor` | `FASTJavaForStatement` | I am the incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializer` | `FASTJavaForStatement` | I am the initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `javaDeclarationOwner` | `FASTJavaTDeclaration` | `declarations` | `FASTJavaTWithDeclarations` | The element that declares me|
| `javaForEachStatementOwner` | `FASTTStatement` | `body` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|
| `whileBodyOwner` | `FASTTStatement` | `body` | `FASTJavaWhileStatement` | I am the body of the do|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declarations` | `FASTJavaTWithDeclarations` | `javaDeclarationOwner` | `FASTJavaTDeclaration` | The elements I declare|
| `interfaces` | `FASTJavaClassDeclaration` | `javaClassDeclarationInterfaceOwner` | `FASTJavaTypeExpression` | The interfaces I implement|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaTModifier` | My modifiers|
| `superclass` | `FASTJavaClassDeclaration` | `javaClassDeclarationSuperclassOwner` | `FASTJavaTypeExpression` | My superclass|

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
	#name : #FASTJavaClassDeclaration,
	#superclass : #FASTJavaEntity,
	#traits : '(FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithModifiers + FASTTNamedEntity + FASTTStatement + FamixTHasImmediateSource withPrecedenceOf: FamixTHasImmediateSource)',
	#classTraits : '(FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithModifiers classTrait + FASTTNamedEntity classTrait + FASTTStatement classTrait + FamixTHasImmediateSource classTrait withPrecedenceOf: FamixTHasImmediateSource classTrait)',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #classDeclarations',
		'#interfaces => FMMany type: #FASTJavaTypeExpression opposite: #javaClassDeclarationInterfaceOwner',
		'#superclass => FMOne type: #FASTJavaTypeExpression opposite: #javaClassDeclarationSuperclassOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaClassDeclaration class >> annotation [

	<FMClass: #ClassDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTJavaClassDeclaration >> addInterface: anObject [
	<generated>
	^ self interfaces add: anObject
]

{ #category : #accessing }
FASTJavaClassDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #classDeclarations"

	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	^ compilationUnit
]

{ #category : #accessing }
FASTJavaClassDeclaration >> compilationUnit: anObject [

	<generated>
	compilationUnit := anObject
]

{ #category : #navigation }
FASTJavaClassDeclaration >> compilationUnitGroup [
	<generated>
	<navigation: 'CompilationUnit'>
	^ MooseSpecializedGroup with: self compilationUnit
]

{ #category : #accessing }
FASTJavaClassDeclaration >> interfaces [
	"Relation named: #interfaces type: #FASTJavaTypeExpression opposite: #javaClassDeclarationInterfaceOwner"

	<generated>
	<FMComment: 'The interfaces I implement'>
	<derived>
	^ interfaces
]

{ #category : #accessing }
FASTJavaClassDeclaration >> interfaces: anObject [

	<generated>
	interfaces value: anObject
]

{ #category : #navigation }
FASTJavaClassDeclaration >> interfacesGroup [
	<generated>
	<navigation: 'Interfaces'>
	^ MooseSpecializedGroup withAll: self interfaces asSet
]

{ #category : #accessing }
FASTJavaClassDeclaration >> superclass [
	"Relation named: #superclass type: #FASTJavaTypeExpression opposite: #javaClassDeclarationSuperclassOwner"

	<generated>
	<FMComment: 'My superclass'>
	^ superclass
]

{ #category : #accessing }
FASTJavaClassDeclaration >> superclass: anObject [

	<generated>
	superclass := anObject
]

{ #category : #navigation }
FASTJavaClassDeclaration >> superclassGroup [
	<generated>
	<navigation: 'Superclass'>
	^ MooseSpecializedGroup with: self superclass
]
