"
I represent a record declaration ([JLS 8.10](https://docs.oracle.com/javase/specs/jls/se17/html/jls-8.html#jls-8.10)).
Example:
```language=text
public record Point(int x, int y) {
}
```

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FASTJavaRecordDeclaration` | `recordDeclarations` | `FASTJavaCompilationUnit` | The compilation unit that owns me|
| `forIncrementorOwner` | `FASTTStatement` | `incrementor` | `FASTJavaForStatement` | I am the incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializer` | `FASTJavaForStatement` | I am the initializer of the for|
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
| `components` | `FASTJavaRecordDeclaration` | `recordOwner` | `FASTJavaParameter` | The record components I declare|
| `declarations` | `FASTJavaTWithDeclarations` | `javaDeclarationOwner` | `FASTJavaTDeclaration` | The elements I declare|
| `interfaces` | `FASTJavaRecordDeclaration` | `javaRecordDeclarationInterfaceOwner` | `FASTJavaTypeExpression` | The interfaces I implement|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaTModifier` | My modifiers|
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
	#name : 'FASTJavaRecordDeclaration',
	#superclass : 'FASTJavaEntity',
	#traits : '(FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithModifiers + FASTJavaTWithTypeParameters + FASTTNamedEntity + FASTTStatement + FamixTHasImmediateSource withPrecedenceOf: FamixTHasImmediateSource)',
	#classTraits : '(FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithModifiers classTrait + FASTJavaTWithTypeParameters classTrait + FASTTNamedEntity classTrait + FASTTStatement classTrait + FamixTHasImmediateSource classTrait withPrecedenceOf: FamixTHasImmediateSource classTrait)',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #recordDeclarations',
		'#components => FMMany type: #FASTJavaParameter opposite: #recordOwner',
		'#interfaces => FMMany type: #FASTJavaTypeExpression opposite: #javaRecordDeclarationInterfaceOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaRecordDeclaration class >> annotation [

	<ignoreForCoverage>
	<FMClass: #RecordDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaRecordDeclaration >> addComponent: anObject [

	<ignoreForCoverage>
	<generated>
	^ self components add: anObject
]

{ #category : 'adding' }
FASTJavaRecordDeclaration >> addInterface: anObject [

	<ignoreForCoverage>
	<generated>
	^ self interfaces add: anObject
]

{ #category : 'accessing' }
FASTJavaRecordDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #recordDeclarations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	^ compilationUnit
]

{ #category : 'accessing' }
FASTJavaRecordDeclaration >> compilationUnit: anObject [

	<ignoreForCoverage>
	<generated>
	compilationUnit := anObject
]

{ #category : 'accessing' }
FASTJavaRecordDeclaration >> components [
	"Relation named: #components type: #FASTJavaParameter opposite: #recordOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The record components I declare'>
	<derived>
	^ components
]

{ #category : 'accessing' }
FASTJavaRecordDeclaration >> components: anObject [

	<ignoreForCoverage>
	<generated>
	components value: anObject
]

{ #category : 'accessing' }
FASTJavaRecordDeclaration >> interfaces [
	"Relation named: #interfaces type: #FASTJavaTypeExpression opposite: #javaRecordDeclarationInterfaceOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The interfaces I implement'>
	<derived>
	^ interfaces
]

{ #category : 'accessing' }
FASTJavaRecordDeclaration >> interfaces: anObject [

	<ignoreForCoverage>
	<generated>
	interfaces value: anObject
]

{ #category : 'testing' }
FASTJavaRecordDeclaration >> isRecordDeclaration [

	<ignoreForCoverage>
	<generated>
	^ true
]
