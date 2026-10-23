"
A part of variable declaration statement containing a variable (named entity) and an expression (optional) that is assigned to it.
A variable declaration statement can contain several declarators.

eg.

int d = 3, e, f = 5;
statement has 3 declarators separated by commas. Second declarator has no expression.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `varDeclOwner` | `FASTJavaVariableDeclarator` | `declarators` | `FASTJavaVarDeclStatement` | The owner of the declarator|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTJavaVariableDeclarator` | `javaVariableDeclaratorExpressionOwner` | `FASTTExpression` | Expression to be assigned to the var during declaration|
| `variable` | `FASTJavaVariableDeclarator` | `javaVariableDeclaratorOwner` | `FASTJavaVariableExpression` | The variable that is being declared|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `dimensions` | `Number` | 0 | The bracket pairs written after my name, eg. the one `mixed` writes in `int mixed[], plain;` and `plain` does not|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaVariableDeclarator',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#instVars : [
		'#dimensions => FMProperty defaultValue: 0',
		'#varDeclOwner => FMOne type: #FASTJavaVarDeclStatement opposite: #declarators',
		'#variable => FMOne type: #FASTJavaVariableExpression opposite: #javaVariableDeclaratorOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaVariableDeclarator class >> annotation [

	<ignoreForCoverage>
	<FMClass: #VariableDeclarator super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaVariableDeclarator >> dimensions [

	<FMProperty: #dimensions type: #Number defaultValue: 0>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'The bracket pairs written after my name, eg. the one `mixed` writes in `int mixed[], plain;` and `plain` does not'>
	^ dimensions ifNil: [ dimensions := 0 ]
]

{ #category : 'accessing' }
FASTJavaVariableDeclarator >> dimensions: anObject [
	<ignoreForCoverage>
	<generated>
	dimensions := anObject
]

{ #category : 'accessing' }
FASTJavaVariableDeclarator >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #javaVariableDeclaratorExpressionOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Expression to be assigned to the var during declaration'>
	<FMProperty: #expression type: #FASTTExpression opposite: #javaVariableDeclaratorExpressionOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaVariableDeclarator >> expression: anObject [

	<ignoreForCoverage>
	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaVariableDeclaratorExpressionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaVariableDeclaratorExpressionOwner: self ]
]

{ #category : 'testing' }
FASTJavaVariableDeclarator >> isVariableDeclarator [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaVariableDeclarator >> varDeclOwner [
	"Relation named: #varDeclOwner type: #FASTJavaVarDeclStatement opposite: #declarators"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The owner of the declarator'>
	<container>
	^ varDeclOwner
]

{ #category : 'accessing' }
FASTJavaVariableDeclarator >> varDeclOwner: anObject [

	<ignoreForCoverage>
	<generated>
	varDeclOwner := anObject
]

{ #category : 'accessing' }
FASTJavaVariableDeclarator >> variable [
	"Relation named: #variable type: #FASTJavaVariableExpression opposite: #javaVariableDeclaratorOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The variable that is being declared'>
	^ variable
]

{ #category : 'accessing' }
FASTJavaVariableDeclarator >> variable: anObject [

	<ignoreForCoverage>
	<generated>
	variable := anObject
]
