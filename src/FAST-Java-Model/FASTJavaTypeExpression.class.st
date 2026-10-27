"
I am an abstract class representing a type

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `catchOwner` | `FASTJavaTypeExpression` | `catchedTypes` | `FASTJavaCatchPartStatement` | The catch part that owns me (ie. where I am catched)|
| `javaCastExpressionAdditionalBoundOwner` | `FASTJavaTypeExpression` | `additionalBounds` | `FASTJavaCastExpression` | The cast that writes me as one of its additional bounds|
| `javaClassDeclarationInterfaceOwner` | `FASTJavaTypeExpression` | `interfaces` | `FASTJavaClassDeclaration` | The class that implements me|
| `javaClassDeclarationPermittedSubtypeOwner` | `FASTJavaTypeExpression` | `permittedSubtypes` | `FASTJavaClassDeclaration` | The sealed class that permits me to extend it|
| `javaClassDeclarationSuperclassOwner` | `FASTJavaTypeExpression` | `superclass` | `FASTJavaClassDeclaration` | The class that extends me|
| `javaEnumDeclarationInterfaceOwner` | `FASTJavaTypeExpression` | `interfaces` | `FASTJavaEnumDeclaration` | The enum that implements me|
| `javaForEachStatementTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaInterfaceDeclarationInterfaceOwner` | `FASTJavaTypeExpression` | `interfaces` | `FASTJavaInterfaceDeclaration` | The interface that extends me|
| `javaInterfaceDeclarationPermittedSubtypeOwner` | `FASTJavaTypeExpression` | `permittedSubtypes` | `FASTJavaInterfaceDeclaration` | The sealed interface that permits me to extend it|
| `javaMethodInvocationTypeArgumentOwner` | `FASTJavaTypeExpression` | `typeArguments` | `FASTJavaMethodInvocation` | The invocation that writes me as one of its type arguments|
| `javaRecordDeclarationInterfaceOwner` | `FASTJavaTypeExpression` | `interfaces` | `FASTJavaRecordDeclaration` | The record that implements me|
| `javaTypePatternTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaTypePattern` | The javaTypePattern type owner (if possible)|



"
Class {
	#name : 'FASTJavaTypeExpression',
	#superclass : 'FASTJavaVariableExpression',
	#instVars : [
		'#catchOwner => FMOne type: #FASTJavaCatchPartStatement opposite: #catchedTypes',
		'#javaCastExpressionAdditionalBoundOwner => FMOne type: #FASTJavaCastExpression opposite: #additionalBounds',
		'#javaClassDeclarationInterfaceOwner => FMOne type: #FASTJavaClassDeclaration opposite: #interfaces',
		'#javaClassDeclarationPermittedSubtypeOwner => FMOne type: #FASTJavaClassDeclaration opposite: #permittedSubtypes',
		'#javaClassDeclarationSuperclassOwner => FMOne type: #FASTJavaClassDeclaration opposite: #superclass',
		'#javaEnumDeclarationInterfaceOwner => FMOne type: #FASTJavaEnumDeclaration opposite: #interfaces',
		'#javaForEachStatementTypeOwner => FMOne type: #FASTJavaForEachStatement opposite: #type',
		'#javaInterfaceDeclarationInterfaceOwner => FMOne type: #FASTJavaInterfaceDeclaration opposite: #interfaces',
		'#javaInterfaceDeclarationPermittedSubtypeOwner => FMOne type: #FASTJavaInterfaceDeclaration opposite: #permittedSubtypes',
		'#javaMethodInvocationTypeArgumentOwner => FMOne type: #FASTJavaMethodInvocation opposite: #typeArguments',
		'#javaRecordDeclarationInterfaceOwner => FMOne type: #FASTJavaRecordDeclaration opposite: #interfaces',
		'#javaTypePatternTypeOwner => FMOne type: #FASTJavaTypePattern opposite: #type'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaTypeExpression class >> annotation [

	<ignoreForCoverage>
	<FMClass: #TypeExpression super: #FASTJavaVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> catchOwner [
	"Relation named: #catchOwner type: #FASTJavaCatchPartStatement opposite: #catchedTypes"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The catch part that owns me (ie. where I am catched)'>
	<container>
	^ catchOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> catchOwner: anObject [

	<ignoreForCoverage>
	<generated>
	catchOwner := anObject
]

{ #category : 'testing' }
FASTJavaTypeExpression >> isTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaCastExpressionAdditionalBoundOwner [
	"Relation named: #javaCastExpressionAdditionalBoundOwner type: #FASTJavaCastExpression opposite: #additionalBounds"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The cast that writes me as one of its additional bounds'>
	<container>
	^ javaCastExpressionAdditionalBoundOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaCastExpressionAdditionalBoundOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaCastExpressionAdditionalBoundOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaClassDeclarationInterfaceOwner [
	"Relation named: #javaClassDeclarationInterfaceOwner type: #FASTJavaClassDeclaration opposite: #interfaces"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The class that implements me'>
	<container>
	^ javaClassDeclarationInterfaceOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaClassDeclarationInterfaceOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaClassDeclarationInterfaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaClassDeclarationPermittedSubtypeOwner [
	"Relation named: #javaClassDeclarationPermittedSubtypeOwner type: #FASTJavaClassDeclaration opposite: #permittedSubtypes"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The sealed class that permits me to extend it'>
	<container>
	^ javaClassDeclarationPermittedSubtypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaClassDeclarationPermittedSubtypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaClassDeclarationPermittedSubtypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaClassDeclarationSuperclassOwner [
	"Relation named: #javaClassDeclarationSuperclassOwner type: #FASTJavaClassDeclaration opposite: #superclass"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The class that extends me'>
	<container>
	<derived>
	^ javaClassDeclarationSuperclassOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaClassDeclarationSuperclassOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaClassDeclarationSuperclassOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaEnumDeclarationInterfaceOwner [
	"Relation named: #javaEnumDeclarationInterfaceOwner type: #FASTJavaEnumDeclaration opposite: #interfaces"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The enum that implements me'>
	<container>
	^ javaEnumDeclarationInterfaceOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaEnumDeclarationInterfaceOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaEnumDeclarationInterfaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaForEachStatementTypeOwner [
	"Relation named: #javaForEachStatementTypeOwner type: #FASTJavaForEachStatement opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaForEachStatement owner (if possible)'>
	<container>
	<derived>
	^ javaForEachStatementTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaForEachStatementTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaForEachStatementTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaInterfaceDeclarationInterfaceOwner [
	"Relation named: #javaInterfaceDeclarationInterfaceOwner type: #FASTJavaInterfaceDeclaration opposite: #interfaces"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The interface that extends me'>
	<container>
	^ javaInterfaceDeclarationInterfaceOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaInterfaceDeclarationInterfaceOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaInterfaceDeclarationInterfaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaInterfaceDeclarationPermittedSubtypeOwner [
	"Relation named: #javaInterfaceDeclarationPermittedSubtypeOwner type: #FASTJavaInterfaceDeclaration opposite: #permittedSubtypes"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The sealed interface that permits me to extend it'>
	<container>
	^ javaInterfaceDeclarationPermittedSubtypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaInterfaceDeclarationPermittedSubtypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaInterfaceDeclarationPermittedSubtypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaMethodInvocationTypeArgumentOwner [
	"Relation named: #javaMethodInvocationTypeArgumentOwner type: #FASTJavaMethodInvocation opposite: #typeArguments"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The invocation that writes me as one of its type arguments'>
	<container>
	^ javaMethodInvocationTypeArgumentOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaMethodInvocationTypeArgumentOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaMethodInvocationTypeArgumentOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaRecordDeclarationInterfaceOwner [
	"Relation named: #javaRecordDeclarationInterfaceOwner type: #FASTJavaRecordDeclaration opposite: #interfaces"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The record that implements me'>
	<container>
	^ javaRecordDeclarationInterfaceOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaRecordDeclarationInterfaceOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaRecordDeclarationInterfaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaTypePatternTypeOwner [
	"Relation named: #javaTypePatternTypeOwner type: #FASTJavaTypePattern opposite: #type"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaTypePattern type owner (if possible)'>
	<container>
	<derived>
	^ javaTypePatternTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaTypePatternTypeOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaTypePatternTypeOwner := anObject
]
