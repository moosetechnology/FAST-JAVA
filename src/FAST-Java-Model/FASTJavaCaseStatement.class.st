"
case part of switch statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTWithStatements` | Behavioural entity containing the statement block.|
| `forIncrementorOwner` | `FASTTStatement` | `incrementors` | `FASTJavaForStatement` | I am an incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializers` | `FASTJavaForStatement` | I am an initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `javaCaseStatementSwitchOwner` | `FASTJavaCaseStatement` | `cases` | `FASTJavaTWithSwitchBlock` | The switch owner|
| `javaInitializerOwner` | `FASTTStatementBlock` | `statementBlock` | `FASTJavaInitializer` | Behavioural entity containing the statement block|
| `javaSynchronizedStatementOwner` | `FASTTStatementBlock` | `block` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `labels` | `FASTJavaCaseStatement` | `caseStatementOwner` | `FASTJavaSwitchLabel` | The labels of the case statement|
| `statements` | `FASTTStatementBlock` | `statementContainer` | `FASTTStatement` | Statements enclosed in this block|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaCaseStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTStatementBlock',
	#classTraits : 'FASTTStatementBlock classTrait',
	#instVars : [
		'#javaCaseStatementSwitchOwner => FMOne type: #FASTJavaTWithSwitchBlock opposite: #cases',
		'#labels => FMMany type: #FASTJavaSwitchLabel opposite: #caseStatementOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaCaseStatement class >> annotation [

	<ignoreForCoverage>
	<FMClass: #CaseStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaCaseStatement >> addLabel: anObject [

	<ignoreForCoverage>
	<generated>
	^ self labels add: anObject
]

{ #category : 'testing' }
FASTJavaCaseStatement >> isCaseStatement [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaCaseStatement >> javaCaseStatementSwitchOwner [
	"Relation named: #javaCaseStatementSwitchOwner type: #FASTJavaTWithSwitchBlock opposite: #cases"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The switch owner'>
	<container>
	^ javaCaseStatementSwitchOwner
]

{ #category : 'accessing' }
FASTJavaCaseStatement >> javaCaseStatementSwitchOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaCaseStatementSwitchOwner := anObject
]

{ #category : 'accessing' }
FASTJavaCaseStatement >> labels [
	"Relation named: #labels type: #FASTJavaSwitchLabel opposite: #caseStatementOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The labels of the case statement'>
	<derived>
	^ labels
]

{ #category : 'accessing' }
FASTJavaCaseStatement >> labels: anObject [

	<ignoreForCoverage>
	<generated>
	labels value: anObject
]
