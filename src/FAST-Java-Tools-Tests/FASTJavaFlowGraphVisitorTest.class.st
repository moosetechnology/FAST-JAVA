Class {
	#name : #FASTJavaFlowGraphVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'conditionExpr',
		'ifStmt',
		'declarationStmt',
		'returnStmt',
		'blockStmt'
	],
	#category : #'FAST-Java-Tools-Tests-dependencies'
}

{ #category : #running }
FASTJavaFlowGraphVisitorTest >> setUp [
	| tmpExpression |
	super setUp.

	tmpExpression := FASTJavaVariableExpression new
		name: 'i' ;
		localDeclaration: (FASTJavaNonLocalDeclaration new name: 'i') ;
		yourself.

	conditionExpr := FASTJavaInfixOperation new
		operator: '>' ;
		leftOperand: tmpExpression ;
		rightOperand: (FASTJavaIntegerLiteral new primitiveValue: '0' ; yourself) ;
		yourself.

	declarationStmt	:= FASTJavaVarDeclStatement new.
	returnStmt := FASTJavaReturnStatement new.

	ifStmt := FASTJavaIfStatement new
		condition: conditionExpr ;
		localDeclaration: (FASTJavaNonLocalDeclaration new name: 'i') ;
		yourself.

	blockStmt := FASTJavaStatementBlock new
]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testBlockStatement [
	"{ declarationStmt ; otherStmt; returnStmt; }"
	| otherStmt flowGraph node |
	otherStmt := FASTJavaVarDeclStatement new.
	blockStmt statements: { declarationStmt . otherStmt . returnStmt }.

	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: blockStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphFirstInBlockNode.
	self assert: flowGraph statement equals: declarationStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 1.

	node := flowGraph successors anyOne.
	self assert: node class equals: FASTJavaFlowGraphNode.
	self assert: node statement equals: otherStmt.
	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node class equals: FASTJavaFlowGraphNode.
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors size equals: 1.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testBlockStatementWithIfThen [
	"{ IF ... THEN declarationStmt; returnStmt; }"
	| flowGraph node |
	ifStmt thenPart: declarationStmt.
	blockStmt statements: { ifStmt . returnStmt }.

	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: blockStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphIfNode.
	self assert: flowGraph statement equals: ifStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 2.

	node := flowGraph successors
		detect: [ :n | n statement = declarationStmt ]
		ifNone: [ self fail ].

	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors size equals: 2.
	self assert: (node predecessors includes: flowGraph).
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testBlockStatementWithIfThenElse [
	"{ IF ... THEN declarationStmt; ELSE stmt; returnStmt; }"
	| block flowGraph node |
	ifStmt
		thenPart: declarationStmt ;
		elsePart: FASTJavaVarDeclStatement new ;
		yourself.
	block := FASTJavaStatementBlock new
		statements: { ifStmt . returnStmt } ;
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
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors size equals: 2.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testIfStatementDependenciesBlockThen [
	"IF ... THEN { declarationStmt ; returnStmt; }"
	| flowGraph node |
	blockStmt statements: { declarationStmt . returnStmt }.
	ifStmt thenPart: blockStmt.
	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: ifStmt.

	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 1.
	
	node := flowGraph successors anyOne.
	self assert: node class equals: FASTJavaFlowGraphFirstInBlockNode.
	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors size equals: 1.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testIfStatementDependenciesSingleThen [
	"IF ... THEN declarationStmt;"
	| flowGraph node |
	ifStmt thenPart: declarationStmt.
	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: ifStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphIfNode.
	self assert: flowGraph statement equals: ifStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 1.
	
	node := flowGraph successors anyOne.
	self assert: node statement equals: declarationStmt.
	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testIfStatementDependenciesSingleThenBlockElse [
	"IF ... THEN declarationStmt; ELSE { declarationStmt ; returnStmt; }"
	| flowGraph node |
	blockStmt statements: { declarationStmt . returnStmt }.
	ifStmt
		thenPart: FASTJavaVarDeclStatement new ;
		elsePart: blockStmt.
	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: ifStmt.

	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors size equals: 2.

	node := flowGraph successors
		detect: [ :n | n class = FASTJavaFlowGraphFirstInBlockNode ]
		ifNone: [ self fail ].
	
	self assertCollection: node predecessors hasSameElements: { flowGraph }.
	self assert: node statement equals: declarationStmt.
	self assert: node successors size equals: 1.

	node := node successors anyOne.
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors size equals: 1.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testIfStatementDependenciesSingleThenSingleElse [
	"IF ... THEN declarationStmt; ELSE returnStmt;"
	| flowGraph |
	ifStmt
		thenPart: declarationStmt ;
		elsePart: returnStmt.
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
	| flowGraph |
	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: declarationStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphNode.
	self assert: flowGraph statement equals: declarationStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors isEmpty.
]
