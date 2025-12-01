"
case part of switch statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTBehaviouralEntity` | Behavioural entity containing the statement block.|
| `forIncrementorOwner` | `FASTTStatement` | `incrementor` | `FASTJavaForStatement` | I am the incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializer` | `FASTJavaForStatement` | I am the initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `javaCaseStatementSwitchOwner` | `FASTJavaCaseStatement` | `cases` | `FASTJavaSwitchStatement` | The switch owner|
| `javaInitializerOwner` | `FASTTStatementBlock` | `statementBlock` | `FASTJavaInitializer` | Behavioural entity containing the statement block|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `javaSynchronizedStatementOwner` | `FASTTStatementBlock` | `block` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
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
		'#javaCaseStatementSwitchOwner => FMOne type: #FASTJavaSwitchStatement opposite: #cases'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaCaseStatement class >> annotation [

	<FMClass: #CaseStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'testing' }
FASTJavaCaseStatement >> isCaseStatement [

	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaCaseStatement >> javaCaseStatementSwitchOwner [
	"Relation named: #javaCaseStatementSwitchOwner type: #FASTJavaSwitchStatement opposite: #cases"

	<generated>
	<FMComment: 'The switch owner'>
	<container>
	^ javaCaseStatementSwitchOwner
]

{ #category : 'accessing' }
FASTJavaCaseStatement >> javaCaseStatementSwitchOwner: anObject [

	<generated>
	javaCaseStatementSwitchOwner := anObject
]

{ #category : 'navigation' }
FASTJavaCaseStatement >> javaCaseStatementSwitchOwnerGroup [
	<generated>
	<navigation: 'JavaCaseStatementSwitchOwner'>
	^ MooseSpecializedGroup with: self javaCaseStatementSwitchOwner
]
