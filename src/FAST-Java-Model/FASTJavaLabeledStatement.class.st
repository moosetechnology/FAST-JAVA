"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `forIncrementorOwner` | `FASTTStatement` | `incrementor` | `FASTJavaForStatement` | I am the incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializer` | `FASTJavaForStatement` | I am the initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `labeledStatement` | `FASTJavaLabeledStatement` | `labelStatementOwner` | `FASTTStatement` | Inner statement that is labeled|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `label` | `String` | nil | The label of the labeled statement|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaLabeledStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#label => FMProperty'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaLabeledStatement class >> annotation [

	<FMClass: #LabeledStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'testing' }
FASTJavaLabeledStatement >> isLabeledStatement [

	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaLabeledStatement >> label [

	<FMProperty: #label type: #String>
	<generated>
	<FMComment: 'The label of the labeled statement'>
	^ label
]

{ #category : 'accessing' }
FASTJavaLabeledStatement >> label: anObject [
	<generated>
	label := anObject
]

{ #category : 'accessing' }
FASTJavaLabeledStatement >> labeledStatement [
	"Relation named: #labeledStatement type: #FASTTStatement opposite: #labelStatementOwner"

	<generated>
	<FMComment: 'Inner statement that is labeled'>
	<FMProperty: #labeledStatement type: #FASTTStatement opposite: #labelStatementOwner>
	^ self attributeAt: #labeledStatement ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaLabeledStatement >> labeledStatement: anObject [

	<generated>
	(self attributeAt: #labeledStatement ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self labeledStatement.
		self attributeAt: #labeledStatement put: anObject.
		otherSide labelStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #labeledStatement put: anObject.
		anObject labelStatementOwner: self ]
]

{ #category : 'navigation' }
FASTJavaLabeledStatement >> labeledStatementGroup [
	<generated>
	<navigation: 'LabeledStatement'>
	^ MooseSpecializedGroup with: self labeledStatement
]
