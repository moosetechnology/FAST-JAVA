"
I am a pair of brackets that writes how long the dimension I open is, which only an array creation does (JLS 15.10.1). Like any other pair I carry the annotations written before my brackets, and they are written on the array type that dimension makes.

```language=text
new int @Ann [3]
```

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTJavaDimensionExpression` | `javaDimensionExpressionOwner` | `FASTTExpression` | The expression saying how long the dimension I open is, e.g. the 3 of `new int[3]`|



"
Class {
	#name : 'FASTJavaDimensionExpression',
	#superclass : 'FASTJavaDimension',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaDimensionExpression class >> annotation [

	<ignoreForCoverage>
	<FMClass: #DimensionExpression super: #FASTJavaDimension>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaDimensionExpression >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #javaDimensionExpressionOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The expression saying how long the dimension I open is, e.g. the 3 of `new int[3]`'>
	<FMProperty: #expression type: #FASTTExpression opposite: #javaDimensionExpressionOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaDimensionExpression >> expression: anObject [

	<ignoreForCoverage>
	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaDimensionExpressionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaDimensionExpressionOwner: self ]
]

{ #category : 'testing' }
FASTJavaDimensionExpression >> isDimensionExpression [

	<ignoreForCoverage>
	<generated>
	^ true
]
