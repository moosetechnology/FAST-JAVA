"
A node representing switch statement

eg.
switch (_) {
...
}

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `forIncrementorOwner` | `FASTTStatement` | `incrementor` | `FASTJavaForStatement` | I am the incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializer` | `FASTJavaForStatement` | I am the initializer of the for|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `parentBranchStatement` | `FASTTStatement` | `branches` | `FASTTBranchStatement` | My parent BranchStatement (of which I am a branch)|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `branches` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTStatement` | The various children branches of this BranchStatement|
| `cases` | `FASTJavaSwitchStatement` | `javaCaseStatementSwitchOwner` | `FASTJavaCaseStatement` | The cases of the switch statement|
| `expression` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTExpression` | The expression commanding which branch is executed|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaSwitchStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTBranchStatement',
	#classTraits : 'FASTTBranchStatement classTrait',
	#instVars : [
		'#cases => FMMany type: #FASTJavaCaseStatement opposite: #javaCaseStatementSwitchOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaSwitchStatement class >> annotation [

	<FMClass: #SwitchStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTJavaSwitchStatement >> addCase: anObject [
	<generated>
	^ self cases add: anObject
]

{ #category : 'accessing' }
FASTJavaSwitchStatement >> cases [
	"Relation named: #cases type: #FASTJavaCaseStatement opposite: #javaCaseStatementSwitchOwner"

	<generated>
	<FMComment: 'The cases of the switch statement'>
	<derived>
	^ cases
]

{ #category : 'accessing' }
FASTJavaSwitchStatement >> cases: anObject [

	<generated>
	cases value: anObject
]

{ #category : 'navigation' }
FASTJavaSwitchStatement >> casesGroup [
	<generated>
	<navigation: 'Cases'>
	^ MooseSpecializedGroup withAll: self cases asSet
]

{ #category : 'testing' }
FASTJavaSwitchStatement >> isSwitchStatement [

	<generated>
	^ true
]
