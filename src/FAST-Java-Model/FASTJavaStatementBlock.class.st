"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTWithStatements` | Behavioural entity containing the statement block.|
| `forIncrementorOwner` | `FASTTStatement` | `incrementor` | `FASTJavaForStatement` | I am the incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializer` | `FASTJavaForStatement` | I am the initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `javaCatchPartStatementOwner` | `FASTJavaStatementBlock` | `body` | `FASTJavaCatchPartStatement` | The javaCatchPartStatementOwner owner (if possible)|
| `javaInitializerOwner` | `FASTTStatementBlock` | `statementBlock` | `FASTJavaInitializer` | Behavioural entity containing the statement block|
| `javaSynchronizedStatementOwner` | `FASTTStatementBlock` | `block` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaTryCatchOwner` | `FASTJavaStatementBlock` | `try` | `FASTJavaTryCatchStatement` | The javaTryCatch owner (if possible)|
| `javaTryFinallyOwner` | `FASTJavaStatementBlock` | `finally` | `FASTJavaTryCatchStatement` | The try/finally part that owns me|
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
	#name : 'FASTJavaStatementBlock',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTStatementBlock',
	#classTraits : 'FASTTStatementBlock classTrait',
	#instVars : [
		'#javaCatchPartStatementOwner => FMOne type: #FASTJavaCatchPartStatement opposite: #body',
		'#javaTryCatchOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #try',
		'#javaTryFinallyOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #finally'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaStatementBlock class >> annotation [

	<ignoreForCoverage>
	<FMClass: #StatementBlock super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaStatementBlock >> javaCatchPartStatementOwner [
	"Relation named: #javaCatchPartStatementOwner type: #FASTJavaCatchPartStatement opposite: #body"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaCatchPartStatementOwner owner (if possible)'>
	<container>
	<derived>
	^ javaCatchPartStatementOwner
]

{ #category : 'accessing' }
FASTJavaStatementBlock >> javaCatchPartStatementOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaCatchPartStatementOwner := anObject
]

{ #category : 'accessing' }
FASTJavaStatementBlock >> javaTryCatchOwner [
	"Relation named: #javaTryCatchOwner type: #FASTJavaTryCatchStatement opposite: #try"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaTryCatch owner (if possible)'>
	<container>
	<derived>
	^ javaTryCatchOwner
]

{ #category : 'accessing' }
FASTJavaStatementBlock >> javaTryCatchOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaTryCatchOwner := anObject
]

{ #category : 'accessing' }
FASTJavaStatementBlock >> javaTryFinallyOwner [
	"Relation named: #javaTryFinallyOwner type: #FASTJavaTryCatchStatement opposite: #finally"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The try/finally part that owns me'>
	<container>
	<derived>
	^ javaTryFinallyOwner
]

{ #category : 'accessing' }
FASTJavaStatementBlock >> javaTryFinallyOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaTryFinallyOwner := anObject
]
