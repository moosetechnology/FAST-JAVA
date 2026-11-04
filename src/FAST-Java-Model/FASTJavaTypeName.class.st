"
I represent the name of a type

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `javaAnnotationTypeOwner` | `FASTJavaTypeName` | `type` | `FASTJavaAnnotation` | The annotation whose type I name|
| `javaClassDeclarationPermittedSubtypeOwner` | `FASTJavaTypeName` | `permittedSubtypes` | `FASTJavaClassDeclaration` | The sealed class that permits me to extend it|
| `javaInterfaceDeclarationPermittedSubtypeOwner` | `FASTJavaTypeName` | `permittedSubtypes` | `FASTJavaInterfaceDeclaration` | The sealed interface that permits me to extend it|
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
		'#javaAnnotationTypeOwner => FMOne type: #FASTJavaAnnotation opposite: #type',
		'#javaClassDeclarationPermittedSubtypeOwner => FMOne type: #FASTJavaClassDeclaration opposite: #permittedSubtypes',
		'#javaInterfaceDeclarationPermittedSubtypeOwner => FMOne type: #FASTJavaInterfaceDeclaration opposite: #permittedSubtypes',
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
FASTJavaTypeName >> javaAnnotationTypeOwner [
	"Relation named: #javaAnnotationTypeOwner type: #FASTJavaAnnotation opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The annotation whose type I name'>
	<container>
	^ javaAnnotationTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaAnnotationTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaAnnotationTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaClassDeclarationPermittedSubtypeOwner [
	"Relation named: #javaClassDeclarationPermittedSubtypeOwner type: #FASTJavaClassDeclaration opposite: #permittedSubtypes"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The sealed class that permits me to extend it'>
	<container>
	^ javaClassDeclarationPermittedSubtypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaClassDeclarationPermittedSubtypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaClassDeclarationPermittedSubtypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaInterfaceDeclarationPermittedSubtypeOwner [
	"Relation named: #javaInterfaceDeclarationPermittedSubtypeOwner type: #FASTJavaInterfaceDeclaration opposite: #permittedSubtypes"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The sealed interface that permits me to extend it'>
	<container>
	^ javaInterfaceDeclarationPermittedSubtypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeName >> javaInterfaceDeclarationPermittedSubtypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaInterfaceDeclarationPermittedSubtypeOwner := anObject
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
