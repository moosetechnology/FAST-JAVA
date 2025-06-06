"
A node of a for loop statement.

eg.
for(_;_;_) {
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
| `incrementor` | `FASTJavaForStatement` | `forIncrementorOwner` | `FASTTStatement` | Expression evaluated at the end of each loop|
| `initializer` | `FASTJavaForStatement` | `forIninitializerOwner` | `FASTTStatement` | Expression used at initialization phase of a for loop|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaForStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTLoopStatement',
	#classTraits : 'FASTTLoopStatement classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaForStatement class >> annotation [

	<FMClass: #ForStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaForStatement >> condition [
	"syntactic sugar"

	^self expression
]

{ #category : 'accessing' }
FASTJavaForStatement >> condition: anExpression [
	"syntactic sugar"

	self expression: anExpression 
]

{ #category : 'accessing' }
FASTJavaForStatement >> incrementor [
	"Relation named: #incrementor type: #FASTTStatement opposite: #forIncrementorOwner"

	<generated>
	<FMComment: 'Expression evaluated at the end of each loop'>
	<FMProperty: #incrementor type: #FASTTStatement opposite: #forIncrementorOwner>
	^ self attributeAt: #incrementor ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaForStatement >> incrementor: anObject [

	<generated>
	(self attributeAt: #incrementor ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self incrementor.
		self attributeAt: #incrementor put: anObject.
		otherSide forIncrementorOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #incrementor put: anObject.
		anObject forIncrementorOwner: self ]
]

{ #category : 'navigation' }
FASTJavaForStatement >> incrementorGroup [
	<generated>
	<navigation: 'Incrementor'>
	^ MooseSpecializedGroup with: self incrementor
]

{ #category : 'accessing' }
FASTJavaForStatement >> initializer [
	"Relation named: #initializer type: #FASTTStatement opposite: #forIninitializerOwner"

	<generated>
	<FMComment: 'Expression used at initialization phase of a for loop'>
	<FMProperty: #initializer type: #FASTTStatement opposite: #forIninitializerOwner>
	^ self attributeAt: #initializer ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaForStatement >> initializer: anObject [

	<generated>
	(self attributeAt: #initializer ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self initializer.
		self attributeAt: #initializer put: anObject.
		otherSide forIninitializerOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #initializer put: anObject.
		anObject forIninitializerOwner: self ]
]

{ #category : 'navigation' }
FASTJavaForStatement >> initializerGroup [
	<generated>
	<navigation: 'Initializer'>
	^ MooseSpecializedGroup with: self initializer
]

{ #category : 'testing' }
FASTJavaForStatement >> isForStatement [

	<generated>
	^ true
]
