"
I represent an assert statement

example:

void method (){
	assert condition1 || condition2 : ""error message""
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
| `condition` | `FASTJavaAssertStatement` | `assertConditionOwner` | `FASTTExpression` | The condition of the statement|
| `message` | `FASTJavaAssertStatement` | `javaStringAssertStatementOwner` | `FASTTExpression` | The error message that is raised if the condition is false|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaAssertStatement,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAssertStatement class >> annotation [

	<FMClass: #AssertStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaAssertStatement >> condition [
	"Relation named: #condition type: #FASTTExpression opposite: #assertConditionOwner"

	<generated>
	<FMComment: 'The condition of the statement'>
	<FMProperty: #condition type: #FASTTExpression opposite: #assertConditionOwner>
	^ self attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaAssertStatement >> condition: anObject [

	<generated>
	(self attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self condition.
		self attributeAt: #condition put: anObject.
		otherSide assertConditionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #condition put: anObject.
		anObject assertConditionOwner: self ]
]

{ #category : #navigation }
FASTJavaAssertStatement >> conditionGroup [
	<generated>
	<navigation: 'Condition'>
	^ MooseSpecializedGroup with: self condition
]

{ #category : #accessing }
FASTJavaAssertStatement >> message [
	"Relation named: #message type: #FASTTExpression opposite: #javaStringAssertStatementOwner"

	<generated>
	<FMComment: 'The error message that is raised if the condition is false'>
	<FMProperty: #message type: #FASTTExpression opposite: #javaStringAssertStatementOwner>
	^ self attributeAt: #message ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaAssertStatement >> message: anObject [

	<generated>
	(self attributeAt: #message ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self message.
		self attributeAt: #message put: anObject.
		otherSide javaStringAssertStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #message put: anObject.
		anObject javaStringAssertStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaAssertStatement >> messageGroup [
	<generated>
	<navigation: 'Message'>
	^ MooseSpecializedGroup with: self message
]
