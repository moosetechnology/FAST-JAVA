"
A node of a for loop statement.

eg.
for(Patate p : list) {
...
}

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
| `body` | `FASTTLoopStatement` | `parentLoopStatement` | `FASTTStatement` | The body of the loop|
| `fieldname` | `FASTJavaForEachStatement` | `javaForEachStatementFieldNameOwner` | `FASTJavaIdentifier` | The identifier of the created local variable|
| `list` | `FASTJavaForEachStatement` | `javaForEachStatementOwner` | `FASTTExpression` | The list that the for-each statement iterates over|
| `type` | `FASTJavaForEachStatement` | `javaForEachStatementTypeOwner` | `FASTJavaTypeExpression` | The type of the created local variable|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaForEachStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTLoopStatement + FASTTStatement',
	#classTraits : 'FASTTLoopStatement classTrait + FASTTStatement classTrait',
	#instVars : [
		'#fieldname => FMOne type: #FASTJavaIdentifier opposite: #javaForEachStatementFieldNameOwner',
		'#type => FMOne type: #FASTJavaTypeExpression opposite: #javaForEachStatementTypeOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaForEachStatement class >> annotation [

	<FMClass: #ForEachStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> fieldname [
	"Relation named: #fieldname type: #FASTJavaIdentifier opposite: #javaForEachStatementFieldNameOwner"

	<generated>
	<FMComment: 'The identifier of the created local variable'>
	^ fieldname
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> fieldname: anObject [

	<generated>
	fieldname := anObject
]

{ #category : 'navigation' }
FASTJavaForEachStatement >> fieldnameGroup [
	<generated>
	<navigation: 'Fieldname'>
	^ MooseSpecializedGroup with: self fieldname
]

{ #category : 'testing' }
FASTJavaForEachStatement >> isForEachStatement [

	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> list [
	"Relation named: #list type: #FASTTExpression opposite: #javaForEachStatementOwner"

	<generated>
	<FMComment: 'The list that the for-each statement iterates over'>
	<FMProperty: #list type: #FASTTExpression opposite: #javaForEachStatementOwner>
	^ self attributeAt: #list ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> list: anObject [

	<generated>
	(self attributeAt: #list ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self list.
		self attributeAt: #list put: anObject.
		otherSide javaForEachStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #list put: anObject.
		anObject javaForEachStatementOwner: self ]
]

{ #category : 'navigation' }
FASTJavaForEachStatement >> listGroup [
	<generated>
	<navigation: 'List'>
	^ MooseSpecializedGroup with: self list
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> type [
	"Relation named: #type type: #FASTJavaTypeExpression opposite: #javaForEachStatementTypeOwner"

	<generated>
	<FMComment: 'The type of the created local variable'>
	^ type
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> type: anObject [

	<generated>
	type := anObject
]

{ #category : 'navigation' }
FASTJavaForEachStatement >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
