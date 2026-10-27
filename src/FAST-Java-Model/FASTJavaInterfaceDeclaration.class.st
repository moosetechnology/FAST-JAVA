"
I represent an interface declaration
example
```language=text
public interface MyInterface {
    public static final String CODE = ""SEME"";
}
```

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FASTJavaInterfaceDeclaration` | `interfaceDeclarations` | `FASTJavaCompilationUnit` | The compilation unit that owns me|
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
| `interfaces` | `FASTJavaInterfaceDeclaration` | `javaInterfaceDeclarationInterfaceOwner` | `FASTJavaTypeExpression` | My super interfaces|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaTModifier` | My modifiers|
| `permittedSubtypes` | `FASTJavaInterfaceDeclaration` | `javaInterfaceDeclarationPermittedSubtypeOwner` | `FASTJavaTypeExpression` | The types I permit to extend or implement me|
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
	#name : 'FASTJavaInterfaceDeclaration',
	#superclass : 'FASTJavaEntity',
	#traits : '(FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithModifiers + FASTJavaTWithTypeParameters + FASTTNamedEntity + FASTTStatement + FamixTHasImmediateSource withPrecedenceOf: FamixTHasImmediateSource)',
	#classTraits : '(FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithModifiers classTrait + FASTJavaTWithTypeParameters classTrait + FASTTNamedEntity classTrait + FASTTStatement classTrait + FamixTHasImmediateSource classTrait withPrecedenceOf: FamixTHasImmediateSource classTrait)',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #interfaceDeclarations',
		'#interfaces => FMMany type: #FASTJavaTypeExpression opposite: #javaInterfaceDeclarationInterfaceOwner',
		'#permittedSubtypes => FMMany type: #FASTJavaTypeExpression opposite: #javaInterfaceDeclarationPermittedSubtypeOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaInterfaceDeclaration class >> annotation [

	<ignoreForCoverage>
	<FMClass: #InterfaceDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaInterfaceDeclaration >> addInterface: anObject [

	<ignoreForCoverage>
	<generated>
	^ self interfaces add: anObject
]

{ #category : 'adding' }
FASTJavaInterfaceDeclaration >> addPermittedSubtype: anObject [

	<ignoreForCoverage>
	<generated>
	^ self permittedSubtypes add: anObject
]

{ #category : 'accessing' }
FASTJavaInterfaceDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #interfaceDeclarations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	^ compilationUnit
]

{ #category : 'accessing' }
FASTJavaInterfaceDeclaration >> compilationUnit: anObject [

	<ignoreForCoverage>
	<generated>
	compilationUnit := anObject
]

{ #category : 'accessing' }
FASTJavaInterfaceDeclaration >> interfaces [
	"Relation named: #interfaces type: #FASTJavaTypeExpression opposite: #javaInterfaceDeclarationInterfaceOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'My super interfaces'>
	<derived>
	^ interfaces
]

{ #category : 'accessing' }
FASTJavaInterfaceDeclaration >> interfaces: anObject [

	<ignoreForCoverage>
	<generated>
	interfaces value: anObject
]

{ #category : 'testing' }
FASTJavaInterfaceDeclaration >> isInterfaceDeclaration [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaInterfaceDeclaration >> permittedSubtypes [
	"Relation named: #permittedSubtypes type: #FASTJavaTypeExpression opposite: #javaInterfaceDeclarationPermittedSubtypeOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The types I permit to extend or implement me'>
	<derived>
	^ permittedSubtypes
]

{ #category : 'accessing' }
FASTJavaInterfaceDeclaration >> permittedSubtypes: anObject [

	<ignoreForCoverage>
	<generated>
	permittedSubtypes value: anObject
]
