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
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
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
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaVariableDeclarator,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#instVars : [
		'#varDeclOwner => FMOne type: #FASTJavaVarDeclStatement opposite: #declarators',
		'#variable => FMOne type: #FASTJavaVariableExpression opposite: #javaVariableDeclaratorOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaVariableDeclarator class >> annotation [

	<FMClass: #VariableDeclarator super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #javaVariableDeclaratorExpressionOwner"

	<generated>
	<FMComment: 'Expression to be assigned to the var during declaration'>
	<FMProperty: #expression type: #FASTTExpression opposite: #javaVariableDeclaratorExpressionOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> expression: anObject [

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

{ #category : #navigation }
FASTJavaVariableDeclarator >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> varDeclOwner [
	"Relation named: #varDeclOwner type: #FASTJavaVarDeclStatement opposite: #declarators"

	<generated>
	<FMComment: 'The owner of the declarator'>
	<container>
	^ varDeclOwner
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> varDeclOwner: anObject [

	<generated>
	varDeclOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableDeclarator >> varDeclOwnerGroup [
	<generated>
	<navigation: 'VarDeclOwner'>
	^ MooseSpecializedGroup with: self varDeclOwner
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> variable [
	"Relation named: #variable type: #FASTJavaVariableExpression opposite: #javaVariableDeclaratorOwner"

	<generated>
	<FMComment: 'The variable that is being declared'>
	^ variable
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> variable: anObject [

	<generated>
	variable := anObject
]

{ #category : #navigation }
FASTJavaVariableDeclarator >> variableGroup [
	<generated>
	<navigation: 'Variable'>
	^ MooseSpecializedGroup with: self variable
]
