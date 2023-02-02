"
A FASTJavaVisitor that links local variables used to their (local) declaration)

```
FASTJavaLocalResolverVisitor new on: aFASTJavaMethodEntity
```
"
Class {
	#name : #FASTJavaLocalResolverVisitor,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'scopes'
	],
	#category : #'FAST-Java-Visitor-resolver'
}

{ #category : #accessing }
FASTJavaLocalResolverVisitor >> currentScope [

	^ scopes top
]

{ #category : #accessing }
FASTJavaLocalResolverVisitor >> findDeclaration: aName [
	self currentScope
		at: aName
		ifPresent: [ :decl | ^decl ]
		ifAbsent: [ |scope decl|
			scope := self popScope.
			self hasScopes
				ifTrue: [ decl := self findDeclaration: aName ].
			self pushScope: scope.
			^decl
		]
]

{ #category : #accessing }
FASTJavaLocalResolverVisitor >> hasScopes [
	^scopes size > 0
]

{ #category : #initialization }
FASTJavaLocalResolverVisitor >> initialize [ 
	super initialize.

	scopes := Stack new
]

{ #category : #accessing }
FASTJavaLocalResolverVisitor >> localDeclaration: declarationNode for: referingNode [
	referingNode attributeAt: #declaration put: declarationNode.
	(declarationNode attributeAt: #uses ifAbsentPut: [OrderedCollection new])
		add: referingNode
]

{ #category : #accessing }
FASTJavaLocalResolverVisitor >> nonLocalDeclaration: referingNode withName: name [
	referingNode
		attributeAt: #declaration
		put: (FASTJavaNonLocalDeclaration new name: name)

]

{ #category : #api }
FASTJavaLocalResolverVisitor >> on: aFASTJavaMethodEntity [

	self resetScopes.
	aFASTJavaMethodEntity accept: self
]

{ #category : #accessing }
FASTJavaLocalResolverVisitor >> popScope [

	scopes pop
]

{ #category : #accessing }
FASTJavaLocalResolverVisitor >> pushScope [

	self pushScope: Dictionary new
]

{ #category : #accessing }
FASTJavaLocalResolverVisitor >> pushScope: aScope [

	scopes push: aScope
]

{ #category : #accessing }
FASTJavaLocalResolverVisitor >> resetScopes [

	scopes := Stack new.
	"first scope for the method"
	self pushScope
]

{ #category : #accessing }
FASTJavaLocalResolverVisitor >> scopeAdd: aName declaration: aFASTNode [

	self currentScope
		at: aName
		ifPresent: [ DuplicatedVariableError signal:
			'local variable ' , aName , 'already found in this scope' ]
		ifAbsent: [
			self currentScope at: aName put: aFASTNode.
			aFASTNode attributeAt: #uses put: OrderedCollection new
		].
	
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaParameter: aFASTJavaParameter [
	self scopeAdd: aFASTJavaParameter variable name declaration: aFASTJavaParameter 
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	self
		scopeAdd: aFASTJavaVariableDeclarator variable name
		declaration: aFASTJavaVariableDeclarator varDeclOwner 
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [

	(self findDeclaration: aFASTJavaVariableExpression name)
	ifNil: [
		self
			nonLocalDeclaration: aFASTJavaVariableExpression
			withName: aFASTJavaVariableExpression name
	]
	ifNotNil: [ :decl |
		self 
			localDeclaration: decl
			for: aFASTJavaVariableExpression
		 ]
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	self pushScope.
	super visitFASTTStatementBlock: aFASTJavaStatementBlock.
	self popScope
]
