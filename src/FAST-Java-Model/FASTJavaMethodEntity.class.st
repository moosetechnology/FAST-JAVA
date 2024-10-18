"
Represents a Java method

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `javaDeclarationOwner` | `FASTJavaTDeclaration` | `declarations` | `FASTJavaTWithDeclarations` | The element that declares me|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaTModifier` | My modifiers|
| `parameters` | `FASTTWithParameters` | `parameterOwner` | `FASTTVariableEntity` | My parameters|
| `statementBlock` | `FASTTBehaviouralEntity` | `fastBehaviouralParent` | `FASTTStatementBlock` | Statements block of the behavioural entity|
| `throws` | `FASTJavaMethodEntity` | `javaMethodThrowsOwner` | `FASTJavaClassTypeExpression` | The list of throws exception|
| `type` | `FASTJavaMethodEntity` | `javaMethodTypeOwner` | `FASTJavaVariableExpression` | The type of the method|
| `typeParameters` | `FASTJavaMethodEntity` | `javaMethodTypeParameterOwner` | `FASTJavaTypeParameterExpression` | The list of type parameter|

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
	#name : 'FASTJavaMethodEntity',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithModifiers + FASTTNamedBehaviouralEntity + FamixTHasImmediateSource',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithModifiers classTrait + FASTTNamedBehaviouralEntity classTrait + FamixTHasImmediateSource classTrait',
	#instVars : [
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaMethodTypeOwner',
		'#throws => FMMany type: #FASTJavaClassTypeExpression opposite: #javaMethodThrowsOwner',
		'#typeParameters => FMMany type: #FASTJavaTypeParameterExpression opposite: #javaMethodTypeParameterOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaMethodEntity class >> annotation [

	<FMClass: #MethodEntity super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTJavaMethodEntity >> addThrow: anObject [
	<generated>
	^ self throws add: anObject
]

{ #category : 'adding' }
FASTJavaMethodEntity >> addTypeParameter: anObject [
	<generated>
	^ self typeParameters add: anObject
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> throws [
	"Relation named: #throws type: #FASTJavaClassTypeExpression opposite: #javaMethodThrowsOwner"

	<generated>
	<FMComment: 'The list of throws exception'>
	<derived>
	^ throws
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> throws: anObject [

	<generated>
	throws value: anObject
]

{ #category : 'navigation' }
FASTJavaMethodEntity >> throwsGroup [
	<generated>
	<navigation: 'Throws'>
	^ MooseSpecializedGroup withAll: self throws asSet
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaMethodTypeOwner"

	<generated>
	<FMComment: 'The type of the method'>
	^ type
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> type: anObject [

	<generated>
	type := anObject
]

{ #category : 'navigation' }
FASTJavaMethodEntity >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> typeParameters [
	"Relation named: #typeParameters type: #FASTJavaTypeParameterExpression opposite: #javaMethodTypeParameterOwner"

	<generated>
	<FMComment: 'The list of type parameter'>
	<derived>
	^ typeParameters
]

{ #category : 'accessing' }
FASTJavaMethodEntity >> typeParameters: anObject [

	<generated>
	typeParameters value: anObject
]

{ #category : 'navigation' }
FASTJavaMethodEntity >> typeParametersGroup [
	<generated>
	<navigation: 'TypeParameters'>
	^ MooseSpecializedGroup withAll: self typeParameters asSet
]
