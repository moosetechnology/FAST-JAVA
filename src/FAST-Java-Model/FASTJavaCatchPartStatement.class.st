"
I represent the 'catch' part of the TryCatch Statement

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
		'#body => FMOne type: #FASTJavaStatementBlock opposite: #javaCatchPartStatementOwner',
		'#catchedTypes => FMMany type: #FASTJavaTypeExpression opposite: #catchOwner',
		'#parameter => FMOne type: #FASTJavaVariableExpression opposite: #javaCatchParameterOwnler',
		'#tryOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #catches'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaCatchPartStatement class >> annotation [

	<ignoreForCoverage>
	<FMClass: #CatchPartStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaCatchPartStatement >> addCatchedType: anObject [

	<ignoreForCoverage>
	<generated>
	^ self catchedTypes add: anObject
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> body [
	"Relation named: #body type: #FASTJavaStatementBlock opposite: #javaCatchPartStatementOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The body of the catch part'>
	^ body
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> body: anObject [

	<ignoreForCoverage>
	<generated>
	body := anObject
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> catchedTypes [
	"Relation named: #catchedTypes type: #FASTJavaTypeExpression opposite: #catchOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The types (exception) that are catched'>
	<derived>
	^ catchedTypes
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> catchedTypes: anObject [

	<ignoreForCoverage>
	<generated>
	catchedTypes value: anObject
]

{ #category : 'testing' }
FASTJavaCatchPartStatement >> isCatchPartStatement [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> parameter [
	"Relation named: #parameter type: #FASTJavaVariableExpression opposite: #javaCatchParameterOwnler"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The parameter of the catch part'>
	^ parameter
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> parameter: anObject [

	<ignoreForCoverage>
	<generated>
	parameter := anObject
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> tryOwner [
	"Relation named: #tryOwner type: #FASTJavaTryCatchStatement opposite: #catches"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The try part that owns me'>
	<container>
	^ tryOwner
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> tryOwner: anObject [

	<ignoreForCoverage>
	<generated>
	tryOwner := anObject
]
