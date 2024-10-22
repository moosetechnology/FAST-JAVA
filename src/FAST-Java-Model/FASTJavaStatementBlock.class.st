"
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
| `javaCatchPartStatementOwner` | `FASTJavaStatementBlock` | `body` | `FASTJavaCatchPartStatement` | The javaCatchPartStatementOwner owner (if possible)|
| `javaForEachStatementOwner` | `FASTTStatement` | `body` | `FASTJavaForEachStatement` | The javaForEachStatement owner (if possible)|
| `javaInitializerOwner` | `FASTTStatementBlock` | `statementBlock` | `FASTJavaInitializer` | Behavioural entity containing the statement block|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `javaSynchronizedStatementOwner` | `FASTTStatementBlock` | `block` | `FASTJavaSynchronizedStatement` | The owner of the synchronized block (if possible)|
| `javaTryCatchOwner` | `FASTJavaStatementBlock` | `try` | `FASTJavaTryCatchStatement` | The javaTryCatch owner (if possible)|
| `javaTryFinallyOwner` | `FASTJavaStatementBlock` | `finally` | `FASTJavaTryCatchStatement` | The try/finally part that owns me|
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
	#name : 'FASTJavaStatementBlock',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTStatementBlock',
	#classTraits : 'FASTTStatementBlock classTrait',
	#instVars : [
		'#javaTryCatchOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #try',
		'#javaTryFinallyOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #finally',
		'#javaCatchPartStatementOwner => FMOne type: #FASTJavaCatchPartStatement opposite: #body'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaStatementBlock class >> annotation [

	<FMClass: #StatementBlock super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaStatementBlock >> javaCatchPartStatementOwner [
	"Relation named: #javaCatchPartStatementOwner type: #FASTJavaCatchPartStatement opposite: #body"

	<generated>
	<FMComment: 'The javaCatchPartStatementOwner owner (if possible)'>
	<container>
	<derived>
	^ javaCatchPartStatementOwner
]

{ #category : 'accessing' }
FASTJavaStatementBlock >> javaCatchPartStatementOwner: anObject [

	<generated>
	javaCatchPartStatementOwner := anObject
]

{ #category : 'navigation' }
FASTJavaStatementBlock >> javaCatchPartStatementOwnerGroup [
	<generated>
	<navigation: 'JavaCatchPartStatementOwner'>
	^ MooseSpecializedGroup with: self javaCatchPartStatementOwner
]

{ #category : 'accessing' }
FASTJavaStatementBlock >> javaTryCatchOwner [
	"Relation named: #javaTryCatchOwner type: #FASTJavaTryCatchStatement opposite: #try"

	<generated>
	<FMComment: 'The javaTryCatch owner (if possible)'>
	<container>
	<derived>
	^ javaTryCatchOwner
]

{ #category : 'accessing' }
FASTJavaStatementBlock >> javaTryCatchOwner: anObject [

	<generated>
	javaTryCatchOwner := anObject
]

{ #category : 'navigation' }
FASTJavaStatementBlock >> javaTryCatchOwnerGroup [
	<generated>
	<navigation: 'JavaTryCatchOwner'>
	^ MooseSpecializedGroup with: self javaTryCatchOwner
]

{ #category : 'accessing' }
FASTJavaStatementBlock >> javaTryFinallyOwner [
	"Relation named: #javaTryFinallyOwner type: #FASTJavaTryCatchStatement opposite: #finally"

	<generated>
	<FMComment: 'The try/finally part that owns me'>
	<container>
	<derived>
	^ javaTryFinallyOwner
]

{ #category : 'accessing' }
FASTJavaStatementBlock >> javaTryFinallyOwner: anObject [

	<generated>
	javaTryFinallyOwner := anObject
]

{ #category : 'navigation' }
FASTJavaStatementBlock >> javaTryFinallyOwnerGroup [
	<generated>
	<navigation: 'JavaTryFinallyOwner'>
	^ MooseSpecializedGroup with: self javaTryFinallyOwner
]
