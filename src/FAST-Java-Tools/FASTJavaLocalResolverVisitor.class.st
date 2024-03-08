"
A LocalResolverVisitor for Java

There is actually very little to do, most things are in the FASTCore Local resolver
"
Class {
	#name : #FASTJavaLocalResolverVisitor,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'scoper'
	],
	#category : #'FAST-Java-Tools'
}

{ #category : #api }
FASTJavaLocalResolverVisitor >> on: aFASTBehaviouralEntity [

	scoper := FASTLocalResolverScoping new.
	aFASTBehaviouralEntity accept: self
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaForStatement: aFASTJavaForStatement [

	aFASTJavaForStatement initializer ifNotNil: [ :node | node accept: self].
	aFASTJavaForStatement condition   ifNotNil: [ :node | node accept: self].
	aFASTJavaForStatement incrementor ifNotNil: [ :node | node accept: self].
	aFASTJavaForStatement body accept: self
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaParameter: aFASTJavaParameter [
	"register a parameter declaration into the current scope"

	scoper
		scopeAdd: aFASTJavaParameter variable name
		declaration: aFASTJavaParameter.

	aFASTJavaParameter variable localDeclaration: aFASTJavaParameter.

]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	"register a variable (structuralEntity) declaration into the current scope"

	scoper
		scopeAdd: aFASTJavaVariableDeclarator variable name
		declaration: aFASTJavaVariableDeclarator.

	aFASTJavaVariableDeclarator variable localDeclaration: aFASTJavaVariableDeclarator.

]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [
	"reference to an identifier in the AST that must be bound to its declaration"

	scoper bind: aFASTJavaVariableExpression toLocalDeclaration: aFASTJavaVariableExpression name

]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTTBehaviouralEntity: aFASTBehaviouralEntity [

	aFASTBehaviouralEntity parameters do: [ :param | param accept: self].
	aFASTBehaviouralEntity statementBlock accept: self
]

{ #category : #visiting }
FASTJavaLocalResolverVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	scoper pushScope.

	"visit order is important to ensure declarations are visited before statements"
	(aFASTJavaStatementBlock statements sorted: [:a :b | a startPos < b startPos])
		do: [ :node | node accept: self ].

	^scoper popScope
]
