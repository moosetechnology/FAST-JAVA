"
I represent a java new array node.
ex.

new String()[""10px"", ""Hello world""]

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `brackets` | `FASTJavaNewArray` | `newArrayOwner` | `FASTJavaDimension` | The bracket pairs I write, one per argument|
| `initializer` | `FASTJavaNewArray` | `javaNewArrayInitialOwner` | `FASTTExpression` | The initializer of the array|



"
Class {
	#name : 'FASTJavaNewArray',
	#superclass : 'FASTJavaNewExpression',
	#instVars : [
		'#brackets => FMMany type: #FASTJavaDimension opposite: #newArrayOwner'
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
FASTJavaNewArray >> addBracket: anObject [

	<ignoreForCoverage>
	<generated>
	^ self brackets add: anObject
]

{ #category : 'accessing' }
FASTJavaNewArray >> brackets [
	"Relation named: #brackets type: #FASTJavaDimension opposite: #newArrayOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The bracket pairs I write, one per argument'>
	^ brackets
]

{ #category : 'accessing' }
FASTJavaNewArray >> brackets: anObject [

	<ignoreForCoverage>
	<generated>
	brackets value: anObject
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
