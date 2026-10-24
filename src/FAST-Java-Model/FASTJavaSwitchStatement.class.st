"
A node representing a switch statement

eg.
switch (_) {
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
| `cases` | `FASTJavaTWithSwitchBlock` | `javaCaseStatementSwitchOwner` | `FASTJavaCaseStatement` | The case groups of my switch block, in colon form|
| `condition` | `FASTJavaSwitchStatement` | `switchConditionOwner` | `FASTTExpression` | The condition of the statement|
| `rules` | `FASTJavaTWithSwitchBlock` | `switchOwner` | `FASTJavaSwitchRule` | The rules of my switch block, in arrow form|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaSwitchStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTWithSwitchBlock + FASTTStatement',
	#classTraits : 'FASTJavaTWithSwitchBlock classTrait + FASTTStatement classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaSwitchStatement class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SwitchStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaSwitchStatement >> condition [
	"Relation named: #condition type: #FASTTExpression opposite: #switchConditionOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The condition of the statement'>
	<FMProperty: #condition type: #FASTTExpression opposite: #switchConditionOwner>
	^ self attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaSwitchStatement >> condition: anObject [

	<ignoreForCoverage>
	<generated>
	(self attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self attributeAt: #condition put: anObject.
		otherSide switchConditionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #condition put: anObject.
		anObject switchConditionOwner: self ]
]

{ #category : 'testing' }
FASTJavaSwitchStatement >> isSwitchStatement [

	<ignoreForCoverage>
	<generated>
	^ true
]
