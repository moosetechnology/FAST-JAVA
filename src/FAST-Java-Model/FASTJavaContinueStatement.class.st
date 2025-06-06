"
A node representing continue statement in java

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


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaContinueStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaContinueStatement class >> annotation [

	<FMClass: #ContinueStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'testing' }
FASTJavaContinueStatement >> isContinueStatement [

	<generated>
	^ true
]
