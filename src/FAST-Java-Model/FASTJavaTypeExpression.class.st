"
I am an abstract class representing a type

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `catchOwner` | `FASTJavaTypeExpression` | `catchedTypes` | `FASTJavaCatchPartStatement` | The catch part that owns me (ie. where I am catched)|
| `javaClassDeclarationInterfaceOwner` | `FASTJavaTypeExpression` | `interfaces` | `FASTJavaClassDeclaration` | The class that implements me|
| `javaClassDeclarationSuperclassOwner` | `FASTJavaTypeExpression` | `superclass` | `FASTJavaClassDeclaration` | The class that extends me|
| `javaEnumDeclarationInterfaceOwner` | `FASTJavaTypeExpression` | `interfaces` | `FASTJavaEnumDeclaration` | The enum that implements me|
| `javaForEachStatementTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaInterfaceDeclarationInterfaceOwner` | `FASTJavaTypeExpression` | `interfaces` | `FASTJavaInterfaceDeclaration` | The interface that extends me|
| `javaTypePatternTypeOwner` | `FASTJavaTypeExpression` | `type` | `FASTJavaTypePattern` | The javaTypePattern type owner (if possible)|



"
Class {
	#name : 'FASTJavaTypeExpression',
	#superclass : 'FASTJavaVariableExpression',
	#instVars : [
		'#catchOwner => FMOne type: #FASTJavaCatchPartStatement opposite: #catchedTypes',
		'#javaClassDeclarationInterfaceOwner => FMOne type: #FASTJavaClassDeclaration opposite: #interfaces',
		'#javaClassDeclarationSuperclassOwner => FMOne type: #FASTJavaClassDeclaration opposite: #superclass',
		'#javaEnumDeclarationInterfaceOwner => FMOne type: #FASTJavaEnumDeclaration opposite: #interfaces',
		'#javaForEachStatementTypeOwner => FMOne type: #FASTJavaForEachStatement opposite: #type',
		'#javaInterfaceDeclarationInterfaceOwner => FMOne type: #FASTJavaInterfaceDeclaration opposite: #interfaces',
		'#javaTypePatternTypeOwner => FMOne type: #FASTJavaTypePattern opposite: #type'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaTypeExpression class >> annotation [

	<FMClass: #TypeExpression super: #FASTJavaVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> catchOwner [
	"Relation named: #catchOwner type: #FASTJavaCatchPartStatement opposite: #catchedTypes"

	<generated>
	<FMComment: 'The catch part that owns me (ie. where I am catched)'>
	<container>
	^ catchOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> catchOwner: anObject [

	<generated>
	catchOwner := anObject
]

{ #category : 'testing' }
FASTJavaTypeExpression >> isTypeExpression [

	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaClassDeclarationInterfaceOwner [
	"Relation named: #javaClassDeclarationInterfaceOwner type: #FASTJavaClassDeclaration opposite: #interfaces"

	<generated>
	<FMComment: 'The class that implements me'>
	<container>
	^ javaClassDeclarationInterfaceOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaClassDeclarationInterfaceOwner: anObject [

	<generated>
	javaClassDeclarationInterfaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaClassDeclarationSuperclassOwner [
	"Relation named: #javaClassDeclarationSuperclassOwner type: #FASTJavaClassDeclaration opposite: #superclass"

	<generated>
	<FMComment: 'The class that extends me'>
	<container>
	<derived>
	^ javaClassDeclarationSuperclassOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaClassDeclarationSuperclassOwner: anObject [

	<generated>
	javaClassDeclarationSuperclassOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaEnumDeclarationInterfaceOwner [
	"Relation named: #javaEnumDeclarationInterfaceOwner type: #FASTJavaEnumDeclaration opposite: #interfaces"

	<generated>
	<FMComment: 'The enum that implements me'>
	<container>
	^ javaEnumDeclarationInterfaceOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaEnumDeclarationInterfaceOwner: anObject [

	<generated>
	javaEnumDeclarationInterfaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaForEachStatementTypeOwner [
	"Relation named: #javaForEachStatementTypeOwner type: #FASTJavaForEachStatement opposite: #type"

	<generated>
	<FMComment: 'The javaForEachStatement owner (if possible)'>
	<container>
	<derived>
	^ javaForEachStatementTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaForEachStatementTypeOwner: anObject [

	<generated>
	javaForEachStatementTypeOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaInterfaceDeclarationInterfaceOwner [
	"Relation named: #javaInterfaceDeclarationInterfaceOwner type: #FASTJavaInterfaceDeclaration opposite: #interfaces"

	<generated>
	<FMComment: 'The interface that extends me'>
	<container>
	^ javaInterfaceDeclarationInterfaceOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaInterfaceDeclarationInterfaceOwner: anObject [

	<generated>
	javaInterfaceDeclarationInterfaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaTypePatternTypeOwner [
	"Relation named: #javaTypePatternTypeOwner type: #FASTJavaTypePattern opposite: #type"

	<generated>
	<FMComment: 'The javaTypePattern type owner (if possible)'>
	<container>
	<derived>
	^ javaTypePatternTypeOwner
]

{ #category : 'accessing' }
FASTJavaTypeExpression >> javaTypePatternTypeOwner: anObject [

	<generated>
	javaTypePatternTypeOwner := anObject
]
