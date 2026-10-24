"
A node representing continue statement in java

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


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `label` | `String` | nil | The label targeted by this continue statement|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaContinueStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#label => FMProperty'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaContinueStatement class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ContinueStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaContinueStatement >> isContinueStatement [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaContinueStatement >> label [

	<FMProperty: #label type: #String>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'The label targeted by this continue statement'>
	^ label
]

{ #category : 'accessing' }
FASTJavaContinueStatement >> label: anObject [
	<ignoreForCoverage>
	<generated>
	label := anObject
]
