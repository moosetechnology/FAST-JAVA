"
I represent a class type

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `catchOwner` | `FASTJavaClassTypeExpression` | `caughtTypes` | `FASTJavaCatchPartStatement` | The catch clause that catches me|
| `javaCastExpressionAdditionalBoundOwner` | `FASTJavaClassTypeExpression` | `additionalBounds` | `FASTJavaCastExpression` | The cast that writes me as one of its additional bounds|
| `javaClassDeclarationInterfaceOwner` | `FASTJavaClassTypeExpression` | `interfaces` | `FASTJavaClassDeclaration` | The class that implements me|
| `javaClassDeclarationPermittedSubtypeOwner` | `FASTJavaClassTypeExpression` | `permittedSubtypes` | `FASTJavaClassDeclaration` | The sealed class that permits me to extend it|
| `javaClassDeclarationSuperclassOwner` | `FASTJavaClassTypeExpression` | `superclass` | `FASTJavaClassDeclaration` | The class that extends me|
| `javaEnumDeclarationInterfaceOwner` | `FASTJavaClassTypeExpression` | `interfaces` | `FASTJavaEnumDeclaration` | The enum that implements me|
| `javaInterfaceDeclarationInterfaceOwner` | `FASTJavaClassTypeExpression` | `interfaces` | `FASTJavaInterfaceDeclaration` | The interface that extends me|
| `javaInterfaceDeclarationPermittedSubtypeOwner` | `FASTJavaClassTypeExpression` | `permittedSubtypes` | `FASTJavaInterfaceDeclaration` | The sealed interface that permits me to extend it|
| `javaMethodThrowsOwner` | `FASTJavaClassTypeExpression` | `throws` | `FASTJavaMethodEntity` | The method that throws me|
| `javaNewExpressionTypeOwner` | `FASTJavaClassTypeExpression` | `type` | `FASTJavaNewExpression` | The class instance creation that instantiates me|
| `javaRecordDeclarationInterfaceOwner` | `FASTJavaClassTypeExpression` | `interfaces` | `FASTJavaRecordDeclaration` | The record that implements me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|
| `typeName` | `FASTJavaClassTypeExpression` | `javaTypeNameTypeExpressionOwner` | `FASTJavaTypeName` | The name of the type|



"
Class {
	#name : 'FASTJavaClassTypeExpression',
	#superclass : 'FASTJavaTypeExpression',
	#traits : 'FASTTWithArguments',
	#classTraits : 'FASTTWithArguments classTrait',
	#instVars : [
		'#catchOwner => FMOne type: #FASTJavaCatchPartStatement opposite: #caughtTypes',
		'#javaCastExpressionAdditionalBoundOwner => FMOne type: #FASTJavaCastExpression opposite: #additionalBounds',
		'#javaClassDeclarationInterfaceOwner => FMOne type: #FASTJavaClassDeclaration opposite: #interfaces',
		'#javaClassDeclarationPermittedSubtypeOwner => FMOne type: #FASTJavaClassDeclaration opposite: #permittedSubtypes',
		'#javaClassDeclarationSuperclassOwner => FMOne type: #FASTJavaClassDeclaration opposite: #superclass',
		'#javaEnumDeclarationInterfaceOwner => FMOne type: #FASTJavaEnumDeclaration opposite: #interfaces',
		'#javaInterfaceDeclarationInterfaceOwner => FMOne type: #FASTJavaInterfaceDeclaration opposite: #interfaces',
		'#javaInterfaceDeclarationPermittedSubtypeOwner => FMOne type: #FASTJavaInterfaceDeclaration opposite: #permittedSubtypes',
		'#javaMethodThrowsOwner => FMOne type: #FASTJavaMethodEntity opposite: #throws',
		'#javaNewExpressionTypeOwner => FMOne type: #FASTJavaNewExpression opposite: #type',
		'#javaRecordDeclarationInterfaceOwner => FMOne type: #FASTJavaRecordDeclaration opposite: #interfaces',
		'#typeName => FMOne type: #FASTJavaTypeName opposite: #javaTypeNameTypeExpressionOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaClassTypeExpression class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ClassTypeExpression super: #FASTJavaTypeExpression>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> catchOwner [
	"Relation named: #catchOwner type: #FASTJavaCatchPartStatement opposite: #caughtTypes"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The catch clause that catches me'>
	<container>
	^ catchOwner
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> catchOwner: anObject [

	<ignoreForCoverage>
	<generated>
	catchOwner := anObject
]

{ #category : 'testing' }
FASTJavaClassTypeExpression >> isClassTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaCastExpressionAdditionalBoundOwner [
	"Relation named: #javaCastExpressionAdditionalBoundOwner type: #FASTJavaCastExpression opposite: #additionalBounds"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The cast that writes me as one of its additional bounds'>
	<container>
	^ javaCastExpressionAdditionalBoundOwner
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaCastExpressionAdditionalBoundOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaCastExpressionAdditionalBoundOwner := anObject
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaClassDeclarationInterfaceOwner [
	"Relation named: #javaClassDeclarationInterfaceOwner type: #FASTJavaClassDeclaration opposite: #interfaces"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The class that implements me'>
	<container>
	^ javaClassDeclarationInterfaceOwner
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaClassDeclarationInterfaceOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaClassDeclarationInterfaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaClassDeclarationPermittedSubtypeOwner [
	"Relation named: #javaClassDeclarationPermittedSubtypeOwner type: #FASTJavaClassDeclaration opposite: #permittedSubtypes"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The sealed class that permits me to extend it'>
	<container>
	^ javaClassDeclarationPermittedSubtypeOwner
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaClassDeclarationPermittedSubtypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaClassDeclarationPermittedSubtypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaClassDeclarationSuperclassOwner [
	"Relation named: #javaClassDeclarationSuperclassOwner type: #FASTJavaClassDeclaration opposite: #superclass"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The class that extends me'>
	<container>
	^ javaClassDeclarationSuperclassOwner
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaClassDeclarationSuperclassOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaClassDeclarationSuperclassOwner := anObject
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaEnumDeclarationInterfaceOwner [
	"Relation named: #javaEnumDeclarationInterfaceOwner type: #FASTJavaEnumDeclaration opposite: #interfaces"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The enum that implements me'>
	<container>
	^ javaEnumDeclarationInterfaceOwner
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaEnumDeclarationInterfaceOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaEnumDeclarationInterfaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaInterfaceDeclarationInterfaceOwner [
	"Relation named: #javaInterfaceDeclarationInterfaceOwner type: #FASTJavaInterfaceDeclaration opposite: #interfaces"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The interface that extends me'>
	<container>
	^ javaInterfaceDeclarationInterfaceOwner
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaInterfaceDeclarationInterfaceOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaInterfaceDeclarationInterfaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaInterfaceDeclarationPermittedSubtypeOwner [
	"Relation named: #javaInterfaceDeclarationPermittedSubtypeOwner type: #FASTJavaInterfaceDeclaration opposite: #permittedSubtypes"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The sealed interface that permits me to extend it'>
	<container>
	^ javaInterfaceDeclarationPermittedSubtypeOwner
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaInterfaceDeclarationPermittedSubtypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaInterfaceDeclarationPermittedSubtypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaMethodThrowsOwner [
	"Relation named: #javaMethodThrowsOwner type: #FASTJavaMethodEntity opposite: #throws"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The method that throws me'>
	<container>
	^ javaMethodThrowsOwner
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaMethodThrowsOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaMethodThrowsOwner := anObject
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaNewExpressionTypeOwner [
	"Relation named: #javaNewExpressionTypeOwner type: #FASTJavaNewExpression opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The class instance creation that instantiates me'>
	<container>
	^ javaNewExpressionTypeOwner
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaNewExpressionTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaNewExpressionTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaRecordDeclarationInterfaceOwner [
	"Relation named: #javaRecordDeclarationInterfaceOwner type: #FASTJavaRecordDeclaration opposite: #interfaces"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The record that implements me'>
	<container>
	^ javaRecordDeclarationInterfaceOwner
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> javaRecordDeclarationInterfaceOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaRecordDeclarationInterfaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> typeName [
	"Relation named: #typeName type: #FASTJavaTypeName opposite: #javaTypeNameTypeExpressionOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The name of the type'>
	^ typeName
]

{ #category : 'accessing' }
FASTJavaClassTypeExpression >> typeName: anObject [

	<ignoreForCoverage>
	<generated>
	typeName := anObject
]
