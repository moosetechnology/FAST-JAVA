"
I represent the 'catch' part of the TryCatch Statement

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `forIncrementorOwner` | `FASTTStatement` | `incrementors` | `FASTJavaForStatement` | I am an incrementor of the for|
| `forInitializerOwner` | `FASTTStatement` | `initializers` | `FASTJavaForStatement` | I am an initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|
| `tryOwner` | `FASTJavaCatchPartStatement` | `catches` | `FASTJavaTryCatchStatement` | The try part that owns me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotations` | `FASTJavaTWithAnnotations` | `javaAnnotationOwner` | `FASTJavaAnnotation` | The annotations written on me|
| `body` | `FASTJavaCatchPartStatement` | `javaCatchPartStatementOwner` | `FASTJavaStatementBlock` | The body of the catch part|
| `caughtTypes` | `FASTJavaCatchPartStatement` | `catchOwner` | `FASTJavaClassTypeExpression` | The exception types I catch|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaModifier` | The keywords I write|
| `parameter` | `FASTJavaCatchPartStatement` | `javaCatchParameterOwner` | `FASTJavaVariableExpression` | The parameter of the catch part|


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
	#traits : 'FASTJavaTWithAnnotations + FASTJavaTWithModifiers + FASTTStatement',
	#classTraits : 'FASTJavaTWithAnnotations classTrait + FASTJavaTWithModifiers classTrait + FASTTStatement classTrait',
	#instVars : [
		'#body => FMOne type: #FASTJavaStatementBlock opposite: #javaCatchPartStatementOwner',
		'#caughtTypes => FMMany type: #FASTJavaClassTypeExpression opposite: #catchOwner',
		'#parameter => FMOne type: #FASTJavaVariableExpression opposite: #javaCatchParameterOwner',
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
FASTJavaCatchPartStatement >> addCaughtType: anObject [

	<ignoreForCoverage>
	<generated>
	^ self caughtTypes add: anObject
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
FASTJavaCatchPartStatement >> caughtTypes [
	"Relation named: #caughtTypes type: #FASTJavaClassTypeExpression opposite: #catchOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The exception types I catch'>
	^ caughtTypes
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> caughtTypes: anObject [

	<ignoreForCoverage>
	<generated>
	caughtTypes value: anObject
]

{ #category : 'testing' }
FASTJavaCatchPartStatement >> isCatchPartStatement [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaCatchPartStatement >> parameter [
	"Relation named: #parameter type: #FASTJavaVariableExpression opposite: #javaCatchParameterOwner"

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
