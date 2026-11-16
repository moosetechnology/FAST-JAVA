"
I represent a class type

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `javaMethodThrowsOwner` | `FASTJavaClassTypeExpression` | `throws` | `FASTJavaMethodEntity` | The method that throws me|

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
		'#javaMethodThrowsOwner => FMOne type: #FASTJavaMethodEntity opposite: #throws',
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

{ #category : 'testing' }
FASTJavaClassTypeExpression >> isClassTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ true
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
