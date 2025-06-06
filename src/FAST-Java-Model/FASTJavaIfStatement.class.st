"
A node of a if statement or an if-else statement.

eg.
if(...) {
...
} else {
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
| `expression` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTExpression` | The expression commanding which branch is executed|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaIfStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTConditionalStatement',
	#classTraits : 'FASTTConditionalStatement classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaIfStatement class >> annotation [

	<FMClass: #IfStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaIfStatement >> elsePart [
	"syntactic sugar"

	^self falseBranch
]

{ #category : 'accessing' }
FASTJavaIfStatement >> elsePart: aFASTJavaStatement [
	"syntactic sugar"

	self falseBranch: aFASTJavaStatement 
]

{ #category : 'testing' }
FASTJavaIfStatement >> isIfStatement [

	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaIfStatement >> thenPart [
	"syntactic sugar"

	^self trueBranch 
]

{ #category : 'accessing' }
FASTJavaIfStatement >> thenPart: aFASTJavaStatement [
	"syntactic sugar"

	self trueBranch: aFASTJavaStatement 
]
