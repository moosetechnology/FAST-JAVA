"
A node representing switch statement

eg.
switch (_) {
...
}

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
| `cases` | `FASTJavaSwitchStatement` | `javaCaseStatementSwitchOwner` | `FASTJavaCaseStatement` | The cases of the switch statement|
| `condition` | `FASTJavaSwitchStatement` | `switchConditionOwner` | `FASTTExpression` | The condition of the statement|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaSwitchStatement,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#cases => FMMany type: #FASTJavaCaseStatement opposite: #javaCaseStatementSwitchOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSwitchStatement class >> annotation [

	<FMClass: #SwitchStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTJavaSwitchStatement >> addCase: anObject [
	<generated>
	^ self cases add: anObject
]

{ #category : #accessing }
FASTJavaSwitchStatement >> cases [
	"Relation named: #cases type: #FASTJavaCaseStatement opposite: #javaCaseStatementSwitchOwner"

	<generated>
	<FMComment: 'The cases of the switch statement'>
	<derived>
	^ cases
]

{ #category : #accessing }
FASTJavaSwitchStatement >> cases: anObject [

	<generated>
	cases value: anObject
]

{ #category : #navigation }
FASTJavaSwitchStatement >> casesGroup [
	<generated>
	<navigation: 'Cases'>
	^ MooseSpecializedGroup withAll: self cases asSet
]

{ #category : #accessing }
FASTJavaSwitchStatement >> condition [
	"Relation named: #condition type: #FASTTExpression opposite: #switchConditionOwner"

	<generated>
	<FMComment: 'The condition of the statement'>
	<FMProperty: #condition type: #FASTTExpression opposite: #switchConditionOwner>
	^ self attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaSwitchStatement >> condition: anObject [

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

{ #category : #navigation }
FASTJavaSwitchStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]
