Class {
	#name : #FASTJavaControlDependencyVisitorTest,
	#superclass : #TestCase,
	#category : #'FAST-Java-Tools-Tests-dependencies'
}

{ #category : #running }
FASTJavaControlDependencyVisitorTest >> dependencies: aFASTJavaNode equal: aCollection [
	self
		assertCollection: (FASTJavaFlowGraphBuilder new sdg: aFASTJavaNode)
		hasSameElements: aCollection
]

{ #category : #running }
FASTJavaControlDependencyVisitorTest >> edge: parentNode to: dependingNode [
	^{ parentNode . dependingNode }
]

{ #category : #tests }
FASTJavaControlDependencyVisitorTest >> testBlockStatementDependenciesToStatements [
	| block stmt1 stmt2 |
	stmt1 := FASTJavaVarDeclStatement new.
	stmt2 := FASTJavaReturnStatement new.
	block := FASTJavaStatementBlock new
		statements: { stmt1 .stmt2 } ;
		yourself.

	self dependencies: block equal: { self edge: block to: stmt1 . self edge: block to: stmt2 }
]

{ #category : #tests }
FASTJavaControlDependencyVisitorTest >> testIfStatementDependenciesToThenBlockStatement [
	| ifStmt block stmt1 stmt2 |
	stmt1 := FASTJavaVarDeclStatement new.
	stmt2 := FASTJavaReturnStatement new.
	block := FASTJavaStatementBlock new
		statements: { stmt1 .stmt2 } ;
		yourself.
	ifStmt := FASTJavaIfStatement new
		thenPart: block ;
		yourself.

	self dependencies: ifStmt equal: { self edge: ifStmt to: stmt1 }
]

{ #category : #tests }
FASTJavaControlDependencyVisitorTest >> testIfStatementDependenciesToThenSingleStatement [
	| ifStmt stmt |
	stmt := FASTJavaVarDeclStatement new.
	ifStmt := FASTJavaIfStatement new
		thenPart: stmt ;
		yourself.

	self dependencies: ifStmt equal: { self edge: ifStmt to: stmt }
]
