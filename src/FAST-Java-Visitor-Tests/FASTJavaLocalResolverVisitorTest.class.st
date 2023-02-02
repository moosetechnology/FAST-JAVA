"
A FASTJavaLocalResolverVisitorTest is a test class for testing the behavior of FASTJavaLocalResolverVisitor
"
Class {
	#name : #FASTJavaLocalResolverVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'localResolver'
	],
	#category : #'FAST-Java-Visitor-Tests-resolver'
}

{ #category : #running }
FASTJavaLocalResolverVisitorTest >> setUp [
	super setUp.
	
	localResolver := FASTJavaLocalResolverVisitor new
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testFindDeclarationInCurrentScope [
	|node|
	node := FASTJavaVariableDeclarator new.
	localResolver resetScopes.
	localResolver scopeAdd: 'blah' declaration: node.

	self assert: (localResolver findDeclaration: 'blah') equals: node
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testFindDeclarationInEmptyScope [
	localResolver resetScopes.
	self assert: (localResolver findDeclaration: 'blah') equals: nil.

]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testFindDeclarationInParentScope [
	|node|
	node := FASTJavaVariableDeclarator new.
	localResolver resetScopes.
	localResolver scopeAdd: 'blah' declaration: node.
	localResolver pushScope.

	self assert: (localResolver findDeclaration: 'blah') equals: node
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testFindDeclarationNotInScope [
	|node|
	node := FASTJavaVariableDeclarator new.
	localResolver resetScopes.
	localResolver scopeAdd: 'blah' declaration: node.

	self assert: (localResolver findDeclaration: 'blih') equals: nil.

]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testHasScopes [
	self deny: localResolver hasScopes 
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testLocalDeclarationFor [
	| declNode refNode |
	declNode := FASTJavaVariableDeclarator new. 
	refNode := FASTJavaVariableExpression new.
	localResolver localDeclaration: declNode for: refNode.

	self assert: (refNode attributeAt: #declaration ifAbsent: [nil]) notNil.
	self assert: (refNode attributeAt: #declaration ifAbsent: [nil]) equals: declNode.

	self assert: (declNode attributeAt: #uses ifAbsent: [nil]) size equals: 1.
	self assert: (declNode attributeAt: #uses ifAbsent: [nil]) first equals: refNode
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testNonLocalDeclarationWithName [
	| node |
	node := FASTJavaVariableExpression new name: 'blah'.
	localResolver nonLocalDeclaration: node withName: 'blah'.

	self assert: (node attributeAt: #declaration ifAbsent: [nil]) notNil.
	self assert: (node attributeAt: #declaration ifAbsent: [nil]) class equals: FASTJavaNonLocalDeclaration.
	self assert: (node attributeAt: #declaration ifAbsent: [nil]) name equals: 'blah'
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testResetScopes [
	localResolver resetScopes.
	self assert: localResolver hasScopes.

]
