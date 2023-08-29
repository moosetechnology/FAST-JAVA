Class {
	#name : #FASTJavaLocalResolverVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'localResolver',
		'builder'
	],
	#category : #'FAST-Java-Tools-Tests-resolver'
}

{ #category : #running }
FASTJavaLocalResolverVisitorTest >> setUp [
	super setUp.
	
	builder := FASTJavaTestNodeBuilder new.
	localResolver := FASTJavaLocalResolverVisitor new
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testAddNonLocalDeclaration [
	"testing helper method #addNonLocalDeclaration:"
	localResolver resetScopes.
	localResolver pushScope.

	localResolver scopeAddNonLocalDeclaration: 'blah'.

	"second scope is empty"
	self assert: localResolver popScope isEmpty.

	"first scope contains NonLocalDeclaration"
	self assert: (localResolver findDeclaration: 'blah') class equals: FASTNonLocalDeclaration
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testFindDeclarationInCurrentScope [
	|node|
	node := builder declarator: nil init: nil.
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
	node := builder declarator: nil init: nil.
	localResolver resetScopes.
	localResolver scopeAdd: 'blah' declaration: node.
	localResolver pushScope.

	self assert: (localResolver findDeclaration: 'blah') equals: node
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testFindDeclarationNotInScope [
	|node|
	node := builder declarator: nil init: nil.
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
	"testing helper method #localDeclaration:for:"
	| declNode refNode |
	declNode := builder declarator: nil init: nil. 
	refNode := builder var: nil.
	declNode resetLocalUses.
	localResolver localDeclaration: declNode for: refNode.

	self assert: refNode localDeclaration notNil.
	self assert: refNode localDeclaration equals: declNode.

	self assert: declNode localUses size equals: 1.
	self assert: declNode localUses first equals: refNode
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testNonLocalDeclarationWithName [
	"testing helper method #nonLocalDeclaration:withName:"
	| node |
	node := builder var: 'blah'.
	localResolver resetScopes.

	localResolver nonLocalDeclaration: node withName: 'blah'.

	self assert: node localDeclaration notNil.
	self assert: node localDeclaration class equals: FASTNonLocalDeclaration.
	self assert: node localDeclaration name equals: 'blah'
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testResetScopes [
	localResolver resetScopes.
	self assert: localResolver hasScopes.

]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testScopeAddDeclarationTwiceRaisesError [
	|node|
	node := builder declarator: nil init: nil.
	localResolver resetScopes.

	localResolver scopeAdd: 'blah' declaration: node.

	self assert: localResolver currentScope size equals: 1.

	self
		should: [ localResolver scopeAdd: 'blah' declaration: node ]
		raise: DuplicatedVariableError
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testScopeAddNonLocalDeclarationTwiceRaisesError [
	|node|
	node := builder declarator: nil init: nil. 
	localResolver resetScopes.

	localResolver scopeAddNonLocalDeclaration: 'blah'.

	self assert: localResolver currentScope size equals: 1.

	self
		should: [ localResolver scopeAddNonLocalDeclaration: 'blah' ]
		raise: DuplicatedVariableError
]
