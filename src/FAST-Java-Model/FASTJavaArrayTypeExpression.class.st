"
I represent an array type

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `baseType` | `FASTJavaArrayTypeExpression` | `javaArrayBaseTypeOwner` | `FASTJavaTypeExpression` | The type of my elements, eg. the `Byte` of `Byte[]`|



"
Class {
	#name : 'FASTJavaArrayTypeExpression',
	#superclass : 'FASTJavaTypeExpression',
	#instVars : [
		'#baseType => FMOne type: #FASTJavaTypeExpression opposite: #javaArrayBaseTypeOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaArrayTypeExpression class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ArrayTypeExpression super: #FASTJavaTypeExpression>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaArrayTypeExpression >> baseType [
	"Relation named: #baseType type: #FASTJavaTypeExpression opposite: #javaArrayBaseTypeOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The type of my elements, eg. the `Byte` of `Byte[]`'>
	^ baseType
]

{ #category : 'accessing' }
FASTJavaArrayTypeExpression >> baseType: anObject [

	<ignoreForCoverage>
	<generated>
	baseType := anObject
]

{ #category : 'testing' }
FASTJavaArrayTypeExpression >> isArrayTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ true
]
