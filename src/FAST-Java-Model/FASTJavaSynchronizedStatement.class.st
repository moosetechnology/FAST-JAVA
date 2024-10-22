"
I represent a 'synchronized' statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `doBodyOwner` | `FASTTStatement` | `body` | `FASTJavaDoWhileStatement` | I am the body of the do|
| `forBodyOwner` | `FASTTStatement` | `body` | `FASTJavaForStatement` | I am the body of the for|
| `forIncrementorOwner` | `FASTTStatement` | `incrementor` | `FASTJavaForStatement` | I am the incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializer` | `FASTJavaForStatement` | I am the initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `javaForEachStatementOwner` | `FASTTStatement` | `body` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|
| `whileBodyOwner` | `FASTTStatement` | `body` | `FASTJavaWhileStatement` | I am the body of the do|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `block` | `FASTJavaSynchronizedStatement` | `javaSynchronizedStatementOwner` | `FASTTStatementBlock` | The block that is synchronized|
| `expression` | `FASTJavaSynchronizedStatement` | `javaSynchronizedStatementOwner` | `FASTTExpression` | The instance on which the statement block is synchronized|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaSynchronizedStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaSynchronizedStatement class >> annotation [

	<FMClass: #SynchronizedStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaSynchronizedStatement >> block [
	"Relation named: #block type: #FASTTStatementBlock opposite: #javaSynchronizedStatementOwner"

	<generated>
	<FMComment: 'The block that is synchronized'>
	<FMProperty: #block type: #FASTTStatementBlock opposite: #javaSynchronizedStatementOwner>
	^ self attributeAt: #block ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaSynchronizedStatement >> block: anObject [

	<generated>
	(self attributeAt: #block ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self block.
		self attributeAt: #block put: anObject.
		otherSide javaSynchronizedStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #block put: anObject.
		anObject javaSynchronizedStatementOwner: self ]
]

{ #category : 'navigation' }
FASTJavaSynchronizedStatement >> blockGroup [
	<generated>
	<navigation: 'Block'>
	^ MooseSpecializedGroup with: self block
]

{ #category : 'accessing' }
FASTJavaSynchronizedStatement >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #javaSynchronizedStatementOwner"

	<generated>
	<FMComment: 'The instance on which the statement block is synchronized'>
	<FMProperty: #expression type: #FASTTExpression opposite: #javaSynchronizedStatementOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaSynchronizedStatement >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaSynchronizedStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaSynchronizedStatementOwner: self ]
]

{ #category : 'navigation' }
FASTJavaSynchronizedStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : 'testing' }
FASTJavaSynchronizedStatement >> isSynchronizedStatement [

	<generated>
	^ true
]
