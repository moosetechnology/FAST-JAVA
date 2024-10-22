"
case part of switch statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `doBodyOwner` | `FASTTStatement` | `body` | `FASTJavaDoWhileStatement` | I am the body of the do|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTBehaviouralEntity` | Behavioural entity containing the statement block.|
| `forBodyOwner` | `FASTTStatement` | `body` | `FASTJavaForStatement` | I am the body of the for|
| `forIncrementorOwner` | `FASTTStatement` | `incrementor` | `FASTJavaForStatement` | I am the incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializer` | `FASTJavaForStatement` | I am the initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `javaCaseStatementSwitchOwner` | `FASTJavaCaseStatement` | `cases` | `FASTJavaSwitchStatement` | The switch owner|
| `javaForEachStatementOwner` | `FASTTStatement` | `body` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaInitializerOwner` | `FASTTStatementBlock` | `statementBlock` | `FASTJavaInitializer` | Behavioural entity containing the statement block|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `javaSynchronizedStatementOwner` | `FASTTStatementBlock` | `block` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|
| `whileBodyOwner` | `FASTTStatement` | `body` | `FASTJavaWhileStatement` | I am the body of the do|

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
