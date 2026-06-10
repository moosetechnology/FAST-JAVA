"
I represent the 'catch' part of the TryCatch Statement

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
| `tryOwner` | `FASTJavaCatchPartStatement` | `catches` | `FASTJavaTryCatchStatement` | The try part that owns me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `body` | `FASTJavaCatchPartStatement` | `javaCatchPartStatementOwner` | `FASTJavaStatementBlock` | The body of the catch part|
| `catchedTypes` | `FASTJavaCatchPartStatement` | `catchOwner` | `FASTJavaTypeExpression` | The types (exception) that are catched|
| `parameter` | `FASTJavaCatchPartStatement` | `javaCatchParameterOwnler` | `FASTJavaVariableExpression` | The parameter of the catch part|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaCatchPartStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#tryOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #catches',
		'#body => FMOne type: #FASTJavaStatementBlock opposite: #javaCatchPartStatementOwner',
		'#catchedTypes => FMMany type: #FASTJavaTypeExpression opposite: #catchOwner',
		'#parameter => FMOne type: #FASTJavaVariableExpression opposite: #javaCatchParameterOwnler'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaCatchPartStatement class >> annotation [

	<FMClass: #CatchPartStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaCatchPartStatement >> addCatchedType: anObject [
	<generated>
	^ self catchedTypes add: anObject
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> body [
	"Relation named: #body type: #FASTJavaStatementBlock opposite: #javaCatchPartStatementOwner"

	<generated>
	<FMComment: 'The body of the catch part'>
	^ body
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> body: anObject [

	<generated>
	body := anObject
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> catchedTypes [
	"Relation named: #catchedTypes type: #FASTJavaTypeExpression opposite: #catchOwner"

	<generated>
	<FMComment: 'The types (exception) that are catched'>
	<derived>
	^ catchedTypes
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> catchedTypes: anObject [

	<generated>
	catchedTypes value: anObject
]

{ #category : 'testing' }
FASTJavaCatchPartStatement >> isCatchPartStatement [

	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> parameter [
	"Relation named: #parameter type: #FASTJavaVariableExpression opposite: #javaCatchParameterOwnler"

	<generated>
	<FMComment: 'The parameter of the catch part'>
	^ parameter
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> parameter: anObject [

	<generated>
	parameter := anObject
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> tryOwner [
	"Relation named: #tryOwner type: #FASTJavaTryCatchStatement opposite: #catches"

	<generated>
	<FMComment: 'The try part that owns me'>
	<container>
	^ tryOwner
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> tryOwner: anObject [

	<generated>
	tryOwner := anObject
]
