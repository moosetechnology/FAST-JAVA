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
	#superclass : #FASTLocalResolverVisitor,
	#category : #'FAST-Java-Tools-resolver'
}

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaIdentifier: aFASTJavaIdentifier [

	self visitFASTIdentifierExpression: aFASTJavaIdentifier
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
	self visitFASTLocalDeclaration: aFASTJavaParameter

]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	self visitFASTLocalDeclaration: aFASTJavaVariableDeclarator.

	aFASTJavaVariableDeclarator expression ifNotNil: [ :expr | expr accept: self ]
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [
	self visitFASTIdentifierExpression: aFASTJavaVariableExpression
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	self visitFASTScopeChildren: aFASTJavaStatementBlock statements
]
