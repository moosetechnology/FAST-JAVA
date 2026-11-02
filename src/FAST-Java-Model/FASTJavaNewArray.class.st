"
I represent a java new array node.
ex.

new String()[""10px"", ""Hello world""]

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `dimensions` | `FASTJavaNewArray` | `newArrayOwner` | `FASTJavaDimension` | The bracket pairs I write, in the order I write them, eg. the two of `new int[3][]`|
| `initializer` | `FASTJavaNewArray` | `javaNewArrayInitialOwner` | `FASTTExpression` | The initializer of the array|



"
Class {
	#name : 'FASTJavaNewArray',
	#superclass : 'FASTJavaNewExpression',
	#instVars : [
		'#dimensions => FMMany type: #FASTJavaDimension opposite: #newArrayOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaNewArray class >> annotation [

	<ignoreForCoverage>
	<FMClass: #NewArray super: #FASTJavaNewExpression>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaNewArray >> addDimension: anObject [

	<ignoreForCoverage>
	<generated>
	^ self dimensions add: anObject
]

{ #category : 'accessing' }
FASTJavaNewArray >> dimensions [
	"Relation named: #dimensions type: #FASTJavaDimension opposite: #newArrayOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The bracket pairs I write, in the order I write them, eg. the two of `new int[3][]`'>
	^ dimensions
]

{ #category : 'accessing' }
FASTJavaNewArray >> dimensions: anObject [

	<ignoreForCoverage>
	<generated>
	dimensions value: anObject
]

{ #category : 'accessing' }
FASTJavaNewArray >> initializer [
	"Relation named: #initializer type: #FASTTExpression opposite: #javaNewArrayInitialOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The initializer of the array'>
	<FMProperty: #initializer type: #FASTTExpression opposite: #javaNewArrayInitialOwner>
	^ self attributeAt: #initializer ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaNewArray >> initializer: anObject [

	<ignoreForCoverage>
	<generated>
	(self attributeAt: #initializer ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self initializer.
		self attributeAt: #initializer put: anObject.
		otherSide javaNewArrayInitialOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #initializer put: anObject.
		anObject javaNewArrayInitialOwner: self ]
]

{ #category : 'testing' }
FASTJavaNewArray >> isNewArray [

	<ignoreForCoverage>
	<generated>
	^ true
]
