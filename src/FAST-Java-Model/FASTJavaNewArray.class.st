"
I represent a java new array node.
ex.

new String()[""10px"", ""Hello world""]

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `initializer` | `FASTJavaNewArray` | `javaNewArrayInitialOwner` | `FASTTExpression` | The initializer of the array|



"
Class {
	#name : 'FASTJavaNewArray',
	#superclass : 'FASTJavaNewExpression',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaNewArray class >> annotation [

	<FMClass: #NewArray super: #FASTJavaNewExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaNewArray >> initializer [
	"Relation named: #initializer type: #FASTTExpression opposite: #javaNewArrayInitialOwner"

	<generated>
	<FMComment: 'The initializer of the array'>
	<FMProperty: #initializer type: #FASTTExpression opposite: #javaNewArrayInitialOwner>
	^ self attributeAt: #initializer ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaNewArray >> initializer: anObject [

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

{ #category : 'navigation' }
FASTJavaNewArray >> initializerGroup [
	<generated>
	<navigation: 'Initializer'>
	^ MooseSpecializedGroup with: self initializer
]

{ #category : 'testing' }
FASTJavaNewArray >> isNewArray [

	<generated>
	^ true
]
