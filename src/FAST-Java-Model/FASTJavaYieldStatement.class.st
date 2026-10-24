"
I represent a yield statement used to produce a value from a switch expression.

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
| `expression` | `FASTJavaYieldStatement` | `yieldStatementOwner` | `FASTTExpression` | The yielded expression|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaYieldStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaYieldStatement class >> annotation [

	<ignoreForCoverage>
	<FMClass: #YieldStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaYieldStatement >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #yieldStatementOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The yielded expression'>
	<FMProperty: #expression type: #FASTTExpression opposite: #yieldStatementOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaYieldStatement >> expression: anObject [

	<ignoreForCoverage>
	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide yieldStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject yieldStatementOwner: self ]
]

{ #category : 'testing' }
FASTJavaYieldStatement >> isYieldStatement [

	<ignoreForCoverage>
	<generated>
	^ true
]
