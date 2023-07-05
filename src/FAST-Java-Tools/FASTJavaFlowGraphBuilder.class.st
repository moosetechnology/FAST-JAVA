"
A visitor on a FAST Java method that builds a FlowGraph from it

"
Class {
	#name : #FASTJavaFlowGraphBuilder,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'currentNode',
		'variableAccumulator'
	],
	#category : #'FAST-Java-Tools-flowgraph'
}

{ #category : #'instance creation' }
FASTJavaFlowGraphBuilder class >> on: aFASTJavaEntity [
	^self new
		on: aFASTJavaEntity
]

{ #category : #private }
FASTJavaFlowGraphBuilder >> accumulateVariablesFrom: aFASTNode [
	| allVariables |
	allVariables := Array streamContents: [ :stream |
		variableAccumulator := stream.
		aFASTNode accept: self.
	].

	"make sure we empty the accumulator (which is shared) before leaving"
	variableAccumulator := nil.
	^allVariables
]

{ #category : #private }
FASTJavaFlowGraphBuilder >> currentNode [
	^currentNode top
]

{ #category : #private }
FASTJavaFlowGraphBuilder >> currentNode: aFASTJavaFlowGraphNode [
	currentNode push: aFASTJavaFlowGraphNode.
	^aFASTJavaFlowGraphNode
]

{ #category : #private }
FASTJavaFlowGraphBuilder >> exitCurrentNode [
	^currentNode pop
]

{ #category : #api }
FASTJavaFlowGraphBuilder >> on: aFASTJavaNode [
	currentNode := Stack new.
	^aFASTJavaNode accept: self
]

{ #category : #visiting }
FASTJavaFlowGraphBuilder >> visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression [
	self currentNode
		defVariable: (self accumulateVariablesFrom: aFASTJavaAssignementExpression variable) anyOne.
	self currentNode
		refVariables: (self accumulateVariablesFrom: aFASTJavaAssignementExpression expression) asSet
]

{ #category : #visiting }
FASTJavaFlowGraphBuilder >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	^aFASTJavaCastExpression expression accept: self
]

{ #category : #visiting }
FASTJavaFlowGraphBuilder >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	variableAccumulator << aFASTJavaIdentifier localDeclaration
]

{ #category : #visiting }
FASTJavaFlowGraphBuilder >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	self currentNode: (FASTJavaFlowGraphIfNode on: aFASTJavaIfStatement).

	self currentNode
		refVariables: (self accumulateVariablesFrom: aFASTJavaIfStatement condition) asSet.

	self currentNode thenPart: (aFASTJavaIfStatement thenPart accept: self).

	aFASTJavaIfStatement elsePart ifNotNil: [ :elsePart |
			self currentNode elsePart: (elsePart accept: self).
	].

	^self exitCurrentNode

]

{ #category : #visiting }
FASTJavaFlowGraphBuilder >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	self currentNode: (FASTJavaFlowGraphNode on: aFASTJavaVarDeclStatement).

	aFASTJavaVarDeclStatement declarators do: [ :declarator | declarator accept: self ].

	^self exitCurrentNode

]

{ #category : #visiting }
FASTJavaFlowGraphBuilder >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	self currentNode
		defVariable: (self accumulateVariablesFrom: aFASTJavaVariableDeclarator variable) anyOne.
	aFASTJavaVariableDeclarator expression ifNotNil: [ :initialization | 
	self currentNode
		refVariables: (self accumulateVariablesFrom: initialization) asSet ]
]

{ #category : #visiting }
FASTJavaFlowGraphBuilder >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [
	variableAccumulator << aFASTJavaVariableExpression localDeclaration
]

{ #category : #visiting }
FASTJavaFlowGraphBuilder >> visitFASTTBehaviouralEntity: aFASTBehaviouralEntity [
	^aFASTBehaviouralEntity statementBlock accept: self
]

{ #category : #visiting }
FASTJavaFlowGraphBuilder >> visitFASTTExpressionStatement: aFASTTExpressionStatement [
	"FASTJavaExpressionStatement creates a FlowGraphNode and then delegates computation
	of read/wrote variables to the expression"
	self currentNode: (FASTJavaFlowGraphNode on: aFASTTExpressionStatement).

	aFASTTExpressionStatement expression accept: self.

	^self exitCurrentNode

]

{ #category : #visiting }
FASTJavaFlowGraphBuilder >> visitFASTTStatement: aFASTStatement [
	"should not come to this, all statements should have their own visit methods"

	^FASTJavaFlowGraphNode on: aFASTStatement
]

{ #category : #visiting }
FASTJavaFlowGraphBuilder >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	| tmpNode |
	tmpNode := FASTJavaFlowGraphBlockNode new.
	(aFASTJavaStatementBlock statements sorted: [:a :b | a startPos < b startPos])
		do: [ :aStatement | tmpNode addNode: (aStatement accept: self) ].
	^tmpNode
]