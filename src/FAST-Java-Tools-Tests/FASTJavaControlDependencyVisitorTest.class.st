Class {
	#name : #FASTJavaControlDependencyVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : #'FAST-Java-Tools-Tests-dependencies'
}

{ #category : #running }
FASTJavaControlDependencyVisitorTest >> dependencies: aFASTJavaNode equal: aCollection [
	self
		assertCollection: (FASTJavaFlowGraphBuilder new on: aFASTJavaNode)
		hasSameElements: aCollection
]

{ #category : #running }
FASTJavaControlDependencyVisitorTest >> edge: parentNode to: dependingNode [
	^{ parentNode . dependingNode }
]

{ #category : #running }
FASTJavaControlDependencyVisitorTest >> setUp [
	super setUp.
	
	builder := FASTJavaTestNodeBuilder new
]

{ #category : #tests }
FASTJavaControlDependencyVisitorTest >> testBlockStatementDependenciesToStatements [
	| block stmt1 stmt2 |
	stmt1 := builder var: nil declaration: nil.
	stmt2 := builder return: nil.
	block := builder block: { stmt1 .stmt2 }.

	self dependencies: block equal: { self edge: block to: stmt1 . self edge: block to: stmt2 }
]

{ #category : #tests }
FASTJavaControlDependencyVisitorTest >> testIfStatementDependenciesToThenBlockStatement [
	| ifStmt block stmt1 stmt2 |
	stmt1 := builder var: nil declaration: nil.
	stmt2 := builder return: nil.
	block := builder block: { stmt1 .stmt2 }.
	ifStmt := builder if: nil then: block else: nil.

	self dependencies: ifStmt equal: { self edge: ifStmt to: stmt1 }
]

{ #category : #tests }
FASTJavaControlDependencyVisitorTest >> testIfStatementDependenciesToThenSingleStatement [
	| ifStmt stmt |
	stmt := builder var: nil declaration: nil.
	ifStmt := builder if: nil then: stmt else: nil.

	self dependencies: ifStmt equal: { self edge: ifStmt to: stmt }
]
