"
A node of a for loop statement.

e.g.
for(Patate p : list) {
...
}

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

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotations` | `FASTJavaTWithAnnotations` | `javaAnnotationOwner` | `FASTJavaAnnotation` | The annotations written on me|
| `body` | `FASTTLoopStatement` | `parentLoopStatement` | `FASTTStatement` | The body of the loop|
| `list` | `FASTJavaForEachStatement` | `javaForEachStatementOwner` | `FASTTExpression` | The list that the for-each statement iterates over|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaModifier` | The keywords I write|
| `type` | `FASTJavaForEachStatement` | `javaForEachStatementTypeOwner` | `FASTJavaTypeExpression` | The type of the created local variable|
| `variable` | `FASTJavaForEachStatement` | `javaForEachStatementVariableOwner` | `FASTJavaVariableExpression` | The variable I declare, e.g. the `s` of `for (String s : list)`|


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
	#traits : 'FASTJavaTWithAnnotations + FASTJavaTWithModifiers + FASTTLoopStatement + FASTTStatement',
	#classTraits : 'FASTJavaTWithAnnotations classTrait + FASTJavaTWithModifiers classTrait + FASTTLoopStatement classTrait + FASTTStatement classTrait',
	#instVars : [
		'#type => FMOne type: #FASTJavaTypeExpression opposite: #javaForEachStatementTypeOwner',
		'#variable => FMOne type: #FASTJavaVariableExpression opposite: #javaForEachStatementVariableOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaForEachStatement class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ForEachStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaForEachStatement >> isForEachStatement [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> list [
	"Relation named: #list type: #FASTTExpression opposite: #javaForEachStatementOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The list that the for-each statement iterates over'>
	<FMProperty: #list type: #FASTTExpression opposite: #javaForEachStatementOwner>
	^ self attributeAt: #list ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> list: anObject [

	<ignoreForCoverage>
	<generated>
	(self attributeAt: #list ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self list.
		self attributeAt: #list put: anObject.
		otherSide javaForEachStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #list put: anObject.
		anObject javaForEachStatementOwner: self ]
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> type [
	"Relation named: #type type: #FASTJavaTypeExpression opposite: #javaForEachStatementTypeOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The type of the created local variable'>
	^ type
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> type: anObject [

	<ignoreForCoverage>
	<generated>
	type := anObject
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> variable [
	"Relation named: #variable type: #FASTJavaVariableExpression opposite: #javaForEachStatementVariableOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The variable I declare, e.g. the `s` of `for (String s : list)`'>
	^ variable
]

{ #category : 'accessing' }
FASTJavaForEachStatement >> variable: anObject [

	<ignoreForCoverage>
	<generated>
	variable := anObject
]
