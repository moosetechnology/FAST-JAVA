"
I represent the name of a type

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `javaQualifiedTypeNameOwner` | `FASTJavaTypeName` | `namespace` | `FASTJavaQualifiedTypeName` | the name I qualify|
| `javaSuperOwner` | `FASTJavaTypeName` | `type` | `FASTJavaSuper` | The `super` I qualify|
| `javaThisOwner` | `FASTJavaTypeName` | `type` | `FASTJavaThis` | The `this` I qualify|
| `javaTypeNameTypeExpressionOwner` | `FASTJavaTypeName` | `typeName` | `FASTJavaClassTypeExpression` | The type expression that owns me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotations` | `FASTJavaTWithAnnotations` | `javaAnnotationOwner` | `FASTJavaAnnotation` | The annotations written on me|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaTypeName',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTWithAnnotations + FASTTNamedEntity + FASTTWithArguments',
	#classTraits : 'FASTJavaTWithAnnotations classTrait + FASTTNamedEntity classTrait + FASTTWithArguments classTrait',
	#instVars : [
		'#javaQualifiedTypeNameOwner => FMOne type: #FASTJavaQualifiedTypeName opposite: #namespace',
		'#javaSuperOwner => FMOne type: #FASTJavaSuper opposite: #type',
		'#javaThisOwner => FMOne type: #FASTJavaThis opposite: #type',
		'#javaTypeNameTypeExpressionOwner => FMOne type: #FASTJavaClassTypeExpression opposite: #typeName'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaTypeName class >> annotation [

	<ignoreForCoverage>
	<FMClass: #TypeName super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaTypeName >> isTypeName [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaQualifiedTypeNameOwner [
	"Relation named: #javaQualifiedTypeNameOwner type: #FASTJavaQualifiedTypeName opposite: #namespace"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'the name I qualify'>
	<container>
	^ javaQualifiedTypeNameOwner
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaQualifiedTypeNameOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaQualifiedTypeNameOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaSuperOwner [
	"Relation named: #javaSuperOwner type: #FASTJavaSuper opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The `super` I qualify'>
	<container>
	^ javaSuperOwner
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaSuperOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaSuperOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaThisOwner [
	"Relation named: #javaThisOwner type: #FASTJavaThis opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The `this` I qualify'>
	<container>
	^ javaThisOwner
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaThisOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaThisOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaTypeNameTypeExpressionOwner [
	"Relation named: #javaTypeNameTypeExpressionOwner type: #FASTJavaClassTypeExpression opposite: #typeName"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The type expression that owns me'>
	<container>
	<derived>
	^ javaTypeNameTypeExpressionOwner
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaTypeNameTypeExpressionOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaTypeNameTypeExpressionOwner := anObject
]
