"
A node of a for loop statement.

eg.
for(Patate p : list) {
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
| `fieldname` | `FASTJavaForEachStatement` | `javaForEachStatementFieldNameOwner` | `FASTJavaIdentifier` | The identifier of the created local variable|
| `type` | `FASTJavaForEachStatement` | `javaForEachStatementTypeOwner` | `FASTJavaTypeExpression` | The type of the created local variable|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaForEachStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTBreakableStatement + FASTTLoopStatement',
	#classTraits : 'FASTTBreakableStatement classTrait + FASTTLoopStatement classTrait',
	#instVars : [
		'#fieldname => FMOne type: #FASTJavaIdentifier opposite: #javaForEachStatementFieldNameOwner',
		'#type => FMOne type: #FASTJavaTypeExpression opposite: #javaForEachStatementTypeOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaForEachStatement class >> annotation [

	<FMClass: #ForEachStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> fieldname [
	"Relation named: #fieldname type: #FASTJavaIdentifier opposite: #javaForEachStatementFieldNameOwner"

	<generated>
	<FMComment: 'The identifier of the created local variable'>
	^ fieldname
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> fieldname: anObject [

	<generated>
	fieldname := anObject
]

{ #category : 'navigation' }
FASTJavaForEachStatement >> fieldnameGroup [
	<generated>
	<navigation: 'Fieldname'>
	^ MooseSpecializedGroup with: self fieldname
]

{ #category : 'testing' }
FASTJavaForEachStatement >> isForEachStatement [

	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> type [
	"Relation named: #type type: #FASTJavaTypeExpression opposite: #javaForEachStatementTypeOwner"

	<generated>
	<FMComment: 'The type of the created local variable'>
	^ type
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> type: anObject [

	<generated>
	type := anObject
]

{ #category : 'navigation' }
FASTJavaForEachStatement >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
