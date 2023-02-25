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
		'nonLocalDeclaration'
	],
	#category : #'FAST-Java-Tools-Tests-flowgraph'
}

{ #category : #running }
FASTJavaFlowGraphBuilderTest >> setUp [
	super setUp.

	nonLocalDeclaration := FASTJavaNonLocalDeclaration new name: 'i'.

	variableExpr := FASTJavaVariableExpression new
		name: 'i' ;
		localDeclaration: nonLocalDeclaration ;
		yourself.

	infixExpr := FASTJavaInfixOperation new
		operator: '>' ;
		leftOperand: variableExpr ;
		rightOperand: (FASTJavaIntegerLiteral new
			primitiveValue: '0' ;
			yourself) ;
		yourself.

	assignementExpr := FASTJavaAssignementExpression new
		variable: variableExpr ;
		expression: infixExpr ;
		yourself.

	declarationStmt := FASTJavaVarDeclStatement new.
	returnStmt := FASTJavaReturnStatement new.

	ifStmt := FASTJavaIfStatement new
		condition: infixExpr ;
		localDeclaration: nonLocalDeclaration ;
		yourself.

	blockStmt := FASTJavaStatementBlock new
]

{ #category : #'as yet unclassified' }
FASTJavaFlowGraphBuilderTest >> testBlockStatement [
	"{ declarationStmt ; otherStmt; returnStmt; }"
	| otherStmt flowGraph node |
	otherStmt := FASTJavaVarDeclStatement new.
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
	otherStmt := FASTJavaVarDeclStatement new.
	ifStmt thenPart: (FASTJavaStatementBlock new
		statements: { declarationStmt . otherStmt } ;
		yourself).
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
	otherStmt := FASTJavaVarDeclStatement new.
	ifStmt
		thenPart: declarationStmt ;
		elsePart: otherStmt.
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
	statement := FASTJavaExpressionStatement new
		expression: assignementExpr ;
		yourself.

	flowGraph := FASTJavaFlowGraphBuilder on: statement.

	self assert: flowGraph defVariable equals: nonLocalDeclaration.


]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testVariableWroteInDeclaration [
	
	| flowGraph declarator |
	declarator := FASTJavaVariableDeclarator new.
	declarator
		variable: (	FASTJavaVariableExpression new
			name: 'j' ;
			localDeclaration: declarator
			yourself ).
	declarationStmt declarators: {declarator}.

	flowGraph := FASTJavaFlowGraphBuilder on: declarationStmt.

	self assert: flowGraph defVariable equals: declarator.


]

{ #category : #tests }
FASTJavaFlowGraphBuilderTest >> testVariablesReadInAssignement [
	
	| statement flowGraph |
	statement := FASTJavaExpressionStatement new
		expression: assignementExpr ;
		yourself.

	flowGraph := FASTJavaFlowGraphBuilder on: statement.

	self assertCollection: flowGraph refVariables hasSameElements: { nonLocalDeclaration }.


]
