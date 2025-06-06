"
I represent a java throw statement
	
ex:

throw new Hello();

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
| `expression` | `FASTJavaThrowStatement` | `javaThrowStatementOwner` | `FASTTExpression` | The thrown element|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaThrowStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaThrowStatement class >> annotation [

	<FMClass: #ThrowStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaThrowStatement >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #javaThrowStatementOwner"

	<generated>
	<FMComment: 'The thrown element'>
	<FMProperty: #expression type: #FASTTExpression opposite: #javaThrowStatementOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaThrowStatement >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaThrowStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaThrowStatementOwner: self ]
]

{ #category : 'navigation' }
FASTJavaThrowStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : 'testing' }
FASTJavaThrowStatement >> isThrowStatement [

	<generated>
	^ true
]
