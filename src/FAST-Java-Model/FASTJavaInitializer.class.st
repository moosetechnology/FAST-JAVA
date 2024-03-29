"
I represent a Java initializer
	
ex.:

new Button(){

{ something }

}


## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `javaDeclarationOwner` | `FASTJavaTDeclaration` | `declarations` | `FASTJavaTWithDeclarations` | The element that declares me|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `statementBlock` | `FASTJavaInitializer` | `javaInitializerOwner` | `FASTTStatementBlock` | Statements block of the behavioural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `source` | `String` | nil | Actual source code of the source entity|
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaInitializer,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTDeclaration + FASTTScopableEntity + FamixTHasImmediateSource',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTTScopableEntity classTrait + FamixTHasImmediateSource classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaInitializer class >> annotation [

	<FMClass: #Initializer super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaInitializer >> statementBlock [
	"Relation named: #statementBlock type: #FASTTStatementBlock opposite: #javaInitializerOwner"

	<generated>
	<FMComment: 'Statements block of the behavioural entity'>
	<FMProperty: #statementBlock type: #FASTTStatementBlock opposite: #javaInitializerOwner>
	^ self attributeAt: #statementBlock ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaInitializer >> statementBlock: anObject [

	<generated>
	(self attributeAt: #statementBlock ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self statementBlock.
		self attributeAt: #statementBlock put: anObject.
		otherSide javaInitializerOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #statementBlock put: anObject.
		anObject javaInitializerOwner: self ]
]

{ #category : #navigation }
FASTJavaInitializer >> statementBlockGroup [
	<generated>
	<navigation: 'StatementBlock'>
	^ MooseSpecializedGroup with: self statementBlock
]
