Class {
	#name : #FASTJavaFlowGraphBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'ifStmt',
		'declarationStmt',
		'returnStmt',
		'blockStmt',
		'infixExpr',
		'assignementExpr',
		'variableExpr',
		'nonLocalDeclaration',
		'builder'
	],
	#category : #'FAST-Java-Tools-Tests-flowgraph'
}

{ #category : #running }
FASTJavaFlowGraphBuilderTest >> setUp [
	super setUp.

	builder := FASTJavaTestNodeBuilder new.

	nonLocalDeclaration := FASTJavaNonLocalDeclaration new name: 'i'.

	variableExpr := (builder var: 'i')
		localDeclaration: nonLocalDeclaration ;
		yourself.

	infixExpr := builder infix: '>' lhs: variableExpr rhs: (builder literalInt: 0).

	assignementExpr := builder assignement: variableExpr value: infixExpr.

	declarationStmt := builder var: nil declaration: nil.
	returnStmt :=  builder return: nil.

	ifStmt := (builder if: infixExpr then: nil else: nil)
		localDeclaration: nonLocalDeclaration ;
		yourself.

	blockStmt := builder block: #()
]

{ #category : #'as yet unclassified' }
FASTJavaFlowGraphBuilderTest >> testBlockStatement [
	"{ declarationStmt ; otherStmt; returnStmt; }"
	| otherStmt flowGraph node |
	declarationStmt startPos: 1.
	otherStmt := (builder var: nil declaration: nil)
		startPos: 2 ;
		yourself.
	returnStmt startPos: 3.
	blockStmt statements: { declarationStmt . otherStmt . returnStmt }.

	flowGraph := FASTJavaFlowGraphBuilder on: blockStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphBlockNode.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors isEmpty.
	
	"declarationStmt node"
	node := flowGraph firstNode.
	self assert: node statement equals: declarationStmt.
	self assert: node predecessors isEmpty.
	self assert: node successors size equals: 1.

	"otherStmt node"
	node := node successors anyOne.
	self assert: node class equals: FASTJavaFlowGraphNode.
	self assert: node statement equals: otherStmt.
	self assert: node predecessors size equals: 1.
	self assert: node successors size equals: 1.

	"returnStmt node"
	node := node successors anyOne.
	self assert: node class equals: FASTJavaFlowGraphNode.
	self assert: node statement equals: returnStmt.
	self assert: node predecessors size equals: 1.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testBlockStatementWithIfThen [
	"{ IF ... THEN declarationStmt; returnStmt; }"
	| flowGraph node |
	ifStmt thenPart: declarationStmt.
	ifStmt startPos: 1.
	returnStmt startPos: 2.
	blockStmt statements: { ifStmt . returnStmt }.

	flowGraph := FASTJavaFlowGraphBuilder on: blockStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphBlockNode.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors isEmpty.

	"ifStmt node"
	node := flowGraph firstNode.
	self assert: node statement equals: ifStmt.
	self assert: node thenPart notNil.
	self assert: node elsePart isNil.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors isEmpty.

	node := flowGraph firstNode thenPart.
	self assert: node statement equals: declarationStmt.
	self assert: node predecessors isEmpty.
	self assert: node successors isEmpty.

	"returnStmt node (succesor of ifStmt)"
	node := flowGraph firstNode successors anyOne.
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors hasSameElements: { flowGraph firstNode }.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testBlockStatementWithIfThenBlock [
	"{ IF ... THEN { declarationStmt; otherStmt; } returnStmt; }"
	| flowGraph node otherStmt |
	otherStmt := builder var: nil declaration: nil.
	ifStmt thenPart: (builder block: { declarationStmt . otherStmt }).
	ifStmt startPos: 0.
	returnStmt startPos: 3.
	blockStmt statements: { ifStmt . returnStmt }.

	flowGraph := FASTJavaFlowGraphBuilder on: blockStmt.

	"ifStmt node"
	node := flowGraph firstNode.
	self assert: node statement equals: ifStmt.
	self assert: node thenPart notNil.
	self assert: node elsePart isNil.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors isEmpty.

	"ifStmt node, then part"
	node := flowGraph firstNode thenPart.
	self assert: node class equals: FASTJavaFlowGraphBlockNode.
	self assert: node predecessors isEmpty.
	self assert: node successors isEmpty.
	
	"#declarationStmt node in THEN part"
	node := node firstNode.
	self assert: node class equals: FASTJavaFlowGraphNode.
	self assert: node statement equals: declarationStmt.
	self assert: node predecessors isEmpty.
	self assert: node successors size equals: 1.

	"#otherStmt node in THEN part"
	node := node successors anyOne.
	self assert: node statement equals: otherStmt.
	self assert: node predecessors size equals: 1.
	self assert: node successors isEmpty.

	"returnStmt node (succesor of ifStmt)"
	node := flowGraph firstNode successors anyOne.
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors hasSameElements: { flowGraph firstNode }.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testBlockStatementWithIfThenElse [
	"{ IF ... THEN declarationStmt; ELSE otherStmt; returnStmt; }"
	| flowGraph otherStmt node |
	otherStmt := builder var: nil declaration: nil.
	ifStmt
		thenPart: declarationStmt ;
		elsePart: otherStmt.
	ifStmt startPos: 1.
	returnStmt startPos: 2.
	blockStmt statements: { ifStmt . returnStmt }.

	flowGraph := FASTJavaFlowGraphBuilder on: blockStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphBlockNode.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors isEmpty.

	"ifStmt node"
	node := flowGraph firstNode.
	self assert: node statement equals: ifStmt.
	self assert: node thenPart notNil.
	self assert: node elsePart notNil.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors isEmpty.

	node := flowGraph firstNode thenPart.
	self assert: node statement equals: declarationStmt.
	self assert: node predecessors isEmpty.
	self assert: node successors isEmpty.

	node := flowGraph firstNode elsePart.
	self assert: node statement equals: otherStmt.
	self assert: node predecessors isEmpty.
	self assert: node successors isEmpty.

	"returnStmt node (succesor of ifStmt)"
	node := flowGraph firstNode successors anyOne.
	self assert: node statement equals: returnStmt.
	self assertCollection: node predecessors hasSameElements: { flowGraph firstNode }.
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testSimpleStatement [
	| flowGraph |
	flowGraph := FASTJavaFlowGraphBuilder on: declarationStmt.

	self assert: flowGraph class equals: FASTJavaFlowGraphNode.
	self assert: flowGraph statement equals: declarationStmt.
	self assert: flowGraph predecessors isEmpty.
	self assert: flowGraph successors isEmpty.
]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testVariableWroteInAssignement [
	
	| statement flowGraph |
	statement := builder exprStatement: assignementExpr.

	flowGraph := FASTJavaFlowGraphBuilder on: statement.

	self assert: flowGraph defVariable equals: nonLocalDeclaration.


]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testVariableWroteInDeclaration [

	| flowGraph declarator |
	declarator := builder declarator: 'j' init: nil.
	declarator variable localDeclaration: declarator.
	declarationStmt declarators: {declarator}.

	flowGraph := FASTJavaFlowGraphBuilder on: declarationStmt.

	self assert: flowGraph defVariable equals: declarator.


]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testVariablesReadInAssignement [
	
	| statement flowGraph |
	statement := builder exprStatement: assignementExpr.

	flowGraph := FASTJavaFlowGraphBuilder on: statement.

	self assertCollection: flowGraph refVariables hasSameElements: { nonLocalDeclaration }.


]
