"
A node of a if statement or an if-else statement.

eg.
if(...) {
...
} else {
...
}

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `forIncrementorOwner` | `FASTTStatement` | `incrementors` | `FASTJavaForStatement` | I am an incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializers` | `FASTJavaForStatement` | I am an initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `condition` | `FASTTWithCondition` | `parentConditional` | `FASTTExpression` | The boolean condition tested|
| `elsePart` | `FASTJavaIfStatement` | `ifElsePartOwner` | `FASTTStatement` | else part|
| `thenPart` | `FASTJavaIfStatement` | `ifThenPartOwner` | `FASTTStatement` | then part|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaIfStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTConditionalStatement + FASTTStatement',
	#classTraits : 'FASTTConditionalStatement classTrait + FASTTStatement classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaIfStatement class >> annotation [

	<ignoreForCoverage>
	<FMClass: #IfStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaIfStatement >> elsePart [
	"Relation named: #elsePart type: #FASTTStatement opposite: #ifElsePartOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'else part'>
	<FMProperty: #elsePart type: #FASTTStatement opposite: #ifElsePartOwner>
	^ self attributeAt: #elsePart ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaIfStatement >> elsePart: anObject [

	<ignoreForCoverage>
	<generated>
	(self attributeAt: #elsePart ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self elsePart.
		self attributeAt: #elsePart put: anObject.
		otherSide ifElsePartOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #elsePart put: anObject.
		anObject ifElsePartOwner: self ]
]

{ #category : 'testing' }
FASTJavaIfStatement >> isIfStatement [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaIfStatement >> thenPart [
	"Relation named: #thenPart type: #FASTTStatement opposite: #ifThenPartOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'then part'>
	<FMProperty: #thenPart type: #FASTTStatement opposite: #ifThenPartOwner>
	^ self attributeAt: #thenPart ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaIfStatement >> thenPart: anObject [

	<ignoreForCoverage>
	<generated>
	(self attributeAt: #thenPart ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self thenPart.
		self attributeAt: #thenPart put: anObject.
		otherSide ifThenPartOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #thenPart put: anObject.
		anObject ifThenPartOwner: self ]
]
