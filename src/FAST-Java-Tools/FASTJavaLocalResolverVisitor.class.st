"
A FASTJavaVisitor that links local variables used to their (local) declaration

- In the declaration nodes, `#localUses` lists all referencing nodes
- In the referencing nodes, `#localDeclaration` lists the corresponding declaration node or a FASTNonLocalDeclaration if the declaration node could not be found

Invoking:
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
	#category : #'FAST-Java-Tools-resolver'
}

{ #category : #accessing }
FASTJavaLocalResolverVisitor >> currentScope [

	^ scopes top
]

{ #category : #private }
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
	^scopes isNotEmpty
]

{ #category : #initialization }
FASTJavaLocalResolverVisitor >> initialize [ 
	super initialize.

	scopes := Stack new
]

{ #category : #private }
FASTJavaLocalResolverVisitor >> localDeclaration: declarationNode for: referingNode [
	referingNode localDeclaration: declarationNode.
	declarationNode addLocalUse: referingNode
]

{ #category : #private }
FASTJavaLocalResolverVisitor >> nonLocalDeclaration: referingNode withName: name [
	self localDeclaration: (self scopeAddNonLocalDeclaration: name) for: referingNode

]

{ #category : #api }
FASTJavaLocalResolverVisitor >> on: aFASTJavaMethodEntity [

	self resetScopes.
	aFASTJavaMethodEntity accept: self
]

{ #category : #accessing }
FASTJavaLocalResolverVisitor >> popScope [

	^scopes pop
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

{ #category : #private }
FASTJavaLocalResolverVisitor >> scopeAdd: aName declaration: aFASTNode [

	self currentScope
		at: aName
		ifPresent: [ DuplicatedVariableError signal:
			'local variable ' , aName , 'already found in this scope' ]
		ifAbsent: [
			aFASTNode resetLocalUses.
			self currentScope at: aName put: aFASTNode
		].
	
]

{ #category : #private }
FASTJavaLocalResolverVisitor >> scopeAddNonLocalDeclaration: name [
	"add FASTJavaNonLocalDeclaration to top scope"
	| currentScope nonLocalDeclaration |
	currentScope := self popScope.
	scopes
		ifEmpty: [
			self pushScope: currentScope.
			nonLocalDeclaration := FASTJavaNonLocalDeclaration new name: name.
			self
				scopeAdd: name
				declaration: nonLocalDeclaration
			]
		ifNotEmpty: [
			nonLocalDeclaration := self scopeAddNonLocalDeclaration: name.
			self pushScope: currentScope.
		].
	^nonLocalDeclaration 
		
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaIdentifier: aFASTJavaIdentifier [

	(self findDeclaration: aFASTJavaIdentifier name)
	ifNil: [
		self
			nonLocalDeclaration: aFASTJavaIdentifier
			withName: aFASTJavaIdentifier name
	]
	ifNotNil: [ :decl |
		self 
			localDeclaration: decl
			for: aFASTJavaIdentifier
		 ]
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	"cannot trust in visit children because order of parameters and statementBlock is not guaranteed"

	"aFASTJavaMethodEntity modifiers"
	"aFASTJavaMethodEntity type"
	"aFASTJavaMethodEntity name"
	aFASTJavaMethodEntity parameters do: [: node | node accept: self ].
	"aFASTJavaMethodEntity throws"
	aFASTJavaMethodEntity statementBlock accept: self.
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaParameter: aFASTJavaParameter [
	self scopeAdd: aFASTJavaParameter variable name declaration: aFASTJavaParameter 
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	self
		scopeAdd: aFASTJavaVariableDeclarator variable name
		declaration: aFASTJavaVariableDeclarator.

	aFASTJavaVariableDeclarator localDeclaration: aFASTJavaVariableDeclarator.
	aFASTJavaVariableDeclarator expression ifNotNil: [ :expr | expr accept: self ]
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

	"visit order is important to ensure declarations are visited before statements"
	(aFASTJavaStatementBlock statements sorted: [:a :b | a startPos < b startPos])
		do: [ :node | node accept: self ].

	self popScope
]
