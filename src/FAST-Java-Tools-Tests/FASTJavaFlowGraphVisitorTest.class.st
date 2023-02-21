Class {
	#name : #FASTJavaFlowGraphVisitorTest,
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
	#category : #'FAST-Java-Tools-Tests-dependencies'
}

{ #category : #running }
FASTJavaFlowGraphVisitorTest >> setUp [
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
FASTJavaFlowGraphVisitorTest >> testBlockStatementWithIfThenBlock [
	"{ IF ... THEN { declarationStmt; } returnStmt; }"
	| flowGraph node |
	ifStmt thenPart: (FASTJavaStatementBlock new
		statements: { declarationStmt } ;
		yourself).
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
	self assert: node predecessors size equals: 2.
	self assert: (node predecessors includes: flowGraph).
	self assert: node successors isEmpty.

]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testBlockStatementWithIfThenElse [
	"{ IF ... THEN declarationStmt; ELSE stmt; returnStmt; }"
	| flowGraph node |
	ifStmt
		thenPart: declarationStmt ;
		elsePart: FASTJavaVarDeclStatement new.
	blockStmt statements: { ifStmt . returnStmt }.

	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: blockStmt.

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

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testVariableWroteInAssignement [
	
	| statement flowGraph |
	statement := FASTJavaExpressionStatement new
		expression: assignementExpr ;
		yourself.

	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: statement.

	self assert: flowGraph defVariable equals: nonLocalDeclaration.


]

{ #category : #tests }
FASTJavaFlowGraphVisitorTest >> testVariablesReadInAssignement [
	
	| statement flowGraph |
	statement := FASTJavaExpressionStatement new
		expression: assignementExpr ;
		yourself.

	flowGraph := FASTJavaFlowGraphVisitor new
		sdg: statement.

	self assertCollection: flowGraph refVariables hasSameElements: { nonLocalDeclaration }.


]
