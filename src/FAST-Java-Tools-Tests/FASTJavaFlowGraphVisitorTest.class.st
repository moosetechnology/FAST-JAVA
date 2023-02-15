Class {
	#name : #FASTJavaFlowGraphVisitorTest,
	#superclass : #TestCase,
	#category : #'FAST-Java-Tools-Tests-dependencies'
}

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testBlockStatement [
	"{ stmt1 ; stmt2; stmt3; }"
	| block stmt1 stmt2 stmt3 flowGraph node |
	stmt1 := FASTJavaVarDeclStatement new.
	stmt2 := FASTJavaVarDeclStatement new.
	stmt3 := FASTJavaReturnStatement new.
	block := FASTJavaStatementBlock new
		statements: { stmt1 . stmt2 . stmt3 } ;
		yourself.

	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: block.

	self assert: flowGraph class equals: FASTJavaFlowGraphFirstInBlockNode.
	self assert: flowGraph statement equals: stmt1.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 1.

	node := flowGraph successors anyOne.
	self assert: node class equals: FASTJavaFlowGraphNode.
	self assert: node statement equals: stmt2.
	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node class equals: FASTJavaFlowGraphNode.
	self assert: node statement equals: stmt3.
	self assertCollection: node predecessors size equals: 1.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testBlockStatementWithIfThen [
	"{ IF ... THEN stmt1; stmt2; }"
	| block stmt1 stmt2 flowGraph node ifStmt |
	stmt1 := FASTJavaVarDeclStatement new.
	stmt2 := FASTJavaReturnStatement new.
	ifStmt := FASTJavaIfStatement new
		thenPart: stmt1 ;
		yourself.
	block := FASTJavaStatementBlock new
		statements: { ifStmt . stmt2 } ;
		yourself.

	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: block.

	self assert: flowGraph class equals: FASTJavaFlowGraphIfNode.
	self assert: flowGraph statement equals: ifStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 2.

	node := flowGraph successors
		detect: [ :n | n statement = stmt1 ]
		ifNone: [ self fail ].

	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node statement equals: stmt2.
	self assertCollection: node predecessors size equals: 2.
	self assert: (node predecessors includes: flowGraph).
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testBlockStatementWithIfThenElse [
	"{ IF ... THEN stmt; ELSE stmt; lastStmt; }"
	| block lastStmt flowGraph node ifStmt |
	lastStmt := FASTJavaReturnStatement new.
	ifStmt := FASTJavaIfStatement new
		thenPart: FASTJavaVarDeclStatement new ;
		elsePart: FASTJavaVarDeclStatement new ;
		yourself.
	block := FASTJavaStatementBlock new
		statements: { ifStmt . lastStmt } ;
		yourself.

	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: block.

	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 2.

	flowGraph successors do: [ :n |
		self assertCollection: n predecessors hasSameElements: { flowGraph }.
		self assert: n successors size equals: 1
	].

	node := flowGraph successors anyOne successors anyOne.
	self assert: node statement equals: lastStmt.
	self assertCollection: node predecessors size equals: 2.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testIfStatementDependenciesBlockThen [
	"IF ... THEN { stmt1 ; stmt2; }"
	| ifStmt flowGraph node stmt1 stmt2 block |
	stmt1 := FASTJavaVarDeclStatement new.
	stmt2 := FASTJavaReturnStatement new.
	block := FASTJavaStatementBlock new
		statements: { stmt1 .stmt2 } ;
		yourself.
	ifStmt := FASTJavaIfStatement new
		thenPart: block ;
		yourself.
	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: ifStmt.

	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 1.
	
	node := flowGraph successors anyOne.
	self assert: node class equals: FASTJavaFlowGraphFirstInBlockNode.
	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node statement equals: stmt2.
	self assertCollection: node predecessors size equals: 1.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testIfStatementDependenciesSingleThen [
	"IF ... THEN stmt;"
	| ifStmt stmt flowGraph node |
	stmt := FASTJavaVarDeclStatement new.
	ifStmt := FASTJavaIfStatement new
		thenPart: stmt ;
		yourself.
	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: ifStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphIfNode.
	self assert: flowGraph statement equals: ifStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 1.
	
	node := flowGraph successors anyOne.
	self assert: node statement equals: stmt.
	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testIfStatementDependenciesSingleThenBlockElse [
	"IF ... THEN stmt; ELSE { stmt1 ; stmt2; }"
	| ifStmt flowGraph node stmt1 stmt2 block |
	stmt1 := FASTJavaVarDeclStatement new.
	stmt2 := FASTJavaReturnStatement new.
	block := FASTJavaStatementBlock new
		statements: { stmt1 .stmt2 } ;
		yourself.
	ifStmt := FASTJavaIfStatement new
		thenPart: FASTJavaVarDeclStatement new ;
		elsePart: block ;
		yourself.
	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: ifStmt.

	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 2.

	node := flowGraph successors
		detect: [ :n | n class = FASTJavaFlowGraphFirstInBlockNode ]
		ifNone: [ self fail ].
	
	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node statement equals: stmt1.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node statement equals: stmt2.
	self assertCollection: node predecessors size equals: 1.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testIfStatementDependenciesSingleThenSingleElse [
	"IF ... THEN stmt; ELSE stmt;"
	| ifStmt flowGraph |
	ifStmt := FASTJavaIfStatement new
		thenPart: FASTJavaVarDeclStatement new ;
		elsePart: FASTJavaVarDeclStatement new ;
		yourself.
	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: ifStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphIfNode.
	self assert: flowGraph statement equals: ifStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 2.

	flowGraph successors do: [ :node |
		self assertCollection: node predecessors hasSameElements: { flowGraph }.
		self assert: node successors isEmpty
	]

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testSimpleStatement [
	| stmt flowGraph |
	stmt := FASTJavaVarDeclStatement new.
	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: stmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphNode.
	self assert: flowGraph statement equals: stmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors isEmpty.
]
