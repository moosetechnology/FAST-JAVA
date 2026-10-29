"
Represents a Java method

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FASTJavaMethodEntity` | `methodDeclarations` | `FASTJavaCompilationUnit` | The compilation unit that owns me|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `javaDeclarationOwner` | `FASTJavaTDeclaration` | `declarations` | `FASTJavaTWithDeclarations` | The element that declares me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaTModifier` | My modifiers|
| `parameters` | `FASTTWithParameters` | `parameterOwner` | `FASTTVariableEntity` | My parameters|
| `receiver` | `FASTJavaMethodEntity` | `methodOwner` | `FASTJavaReceiverParameter` | The receiver parameter I write|
| `statementBlock` | `FASTTWithStatements` | `fastBehaviouralParent` | `FASTTStatementBlock` | Statements block of the behavioural entity|
| `throws` | `FASTJavaMethodEntity` | `javaMethodThrowsOwner` | `FASTJavaClassTypeExpression` | The list of throws exception|
| `type` | `FASTJavaMethodEntity` | `javaMethodTypeOwner` | `FASTJavaVariableExpression` | The type of the method|
| `typeParameters` | `FASTJavaTWithTypeParameters` | `javaTypeParameterOwner` | `FASTJavaTypeParameterExpression` | The type parameters I declare|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `dimensions` | `Number` | 0 | The bracket pairs written after my parameter list, eg. the one of `int[] values() []`|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `source` | `String` | nil | Actual source code of the source entity|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaMethodEntity',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithModifiers + FASTJavaTWithTypeParameters + FASTTNamedBehaviouralEntity + FamixTHasImmediateSource',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithModifiers classTrait + FASTJavaTWithTypeParameters classTrait + FASTTNamedBehaviouralEntity classTrait + FamixTHasImmediateSource classTrait',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #methodDeclarations',
		'#dimensions => FMProperty defaultValue: 0',
		'#receiver => FMOne type: #FASTJavaReceiverParameter opposite: #methodOwner',
		'#throws => FMMany type: #FASTJavaClassTypeExpression opposite: #javaMethodThrowsOwner',
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaMethodTypeOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaMethodEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #MethodEntity super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaMethodEntity >> addThrow: anObject [

	<ignoreForCoverage>
	<generated>
	^ self throws add: anObject
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #methodDeclarations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	^ compilationUnit
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> compilationUnit: anObject [

	<ignoreForCoverage>
	<generated>
	compilationUnit := anObject
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> dimensions [

	<FMProperty: #dimensions type: #Number defaultValue: 0>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'The bracket pairs written after my parameter list, eg. the one of `int[] values() []`'>
	^ dimensions ifNil: [ dimensions := 0 ]
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> dimensions: anObject [
	<ignoreForCoverage>
	<generated>
	dimensions := anObject
]

{ #category : 'testing' }
FASTJavaMethodEntity >> isMethodEntity [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> receiver [
	"Relation named: #receiver type: #FASTJavaReceiverParameter opposite: #methodOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The receiver parameter I write'>
	^ receiver
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> receiver: anObject [

	<ignoreForCoverage>
	<generated>
	receiver := anObject
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> throws [
	"Relation named: #throws type: #FASTJavaClassTypeExpression opposite: #javaMethodThrowsOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The list of throws exception'>
	<derived>
	^ throws
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> throws: anObject [

	<ignoreForCoverage>
	<generated>
	throws value: anObject
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaMethodTypeOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The type of the method'>
	^ type
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> type: anObject [

	<ignoreForCoverage>
	<generated>
	type := anObject
]
