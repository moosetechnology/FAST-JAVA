"
A node of a for loop statement.

eg.
for(_;_;_) {
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
| `body` | `FASTTLoopStatement` | `parentLoopStatement` | `FASTTStatement` | The body of the loop|
| `condition` | `FASTTWithCondition` | `parentConditional` | `FASTTExpression` | The boolean condition tested|
| `incrementors` | `FASTJavaForStatement` | `forIncrementorOwner` | `FASTTStatement` | Statements evaluated at the end of each loop|
| `initializers` | `FASTJavaForStatement` | `forIninitializerOwner` | `FASTTStatement` | Statements evaluated at initialization phase of a for loop|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaForStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTConditionalStatement + FASTTLoopStatement + FASTTStatement',
	#classTraits : 'FASTTConditionalStatement classTrait + FASTTLoopStatement classTrait + FASTTStatement classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaForStatement class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ForStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaForStatement >> addIncrementor: anObject [

	<ignoreForCoverage>
	<generated>
	^ self incrementors add: anObject
]

{ #category : 'adding' }
FASTJavaForStatement >> addInitializer: anObject [

	<ignoreForCoverage>
	<generated>
	^ self initializers add: anObject
]

{ #category : 'accessing' }
FASTJavaForStatement >> incrementors [
	"Relation named: #incrementors type: #FASTTStatement opposite: #forIncrementorOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Statements evaluated at the end of each loop'>
	<derived>
	<FMProperty: #incrementors type: #FASTTStatement opposite: #forIncrementorOwner>
	<multivalued>
	^ self attributeAt: #incrementors ifAbsentPut: [ FMMultivalueLink on: self opposite: #forIncrementorOwner: ]
]

{ #category : 'accessing' }
FASTJavaForStatement >> incrementors: anObject [

	<ignoreForCoverage>
	<generated>
	self incrementors value: anObject
]

{ #category : 'accessing' }
FASTJavaForStatement >> initializers [
	"Relation named: #initializers type: #FASTTStatement opposite: #forIninitializerOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Statements evaluated at initialization phase of a for loop'>
	<derived>
	<FMProperty: #initializers type: #FASTTStatement opposite: #forIninitializerOwner>
	<multivalued>
	^ self attributeAt: #initializers ifAbsentPut: [ FMMultivalueLink on: self opposite: #forIninitializerOwner: ]
]

{ #category : 'accessing' }
FASTJavaForStatement >> initializers: anObject [

	<ignoreForCoverage>
	<generated>
	self initializers value: anObject
]

{ #category : 'testing' }
FASTJavaForStatement >> isForStatement [

	<ignoreForCoverage>
	<generated>
	^ true
]
