Class {
	#name : #FASTJavaFlowGraphStatementcountVisitorTest,
	#superclass : #FASTJavaFlowGraphAbstractVisitorTest,
	#category : #'FAST-Java-Tools-Tests-flowgraph'
}

{ #category : #tests }
FASTJavaFlowGraphStatementcountVisitorTest >> testTraverseBlockNodeEquals_2 [
	self traverse: blockNode returns: 2
]

{ #category : #tests }
FASTJavaFlowGraphStatementcountVisitorTest >> testTraverseSimpleNodeEquals_1 [
	self traverse: simpleNode returns: 1
]

{ #category : #running }
FASTJavaFlowGraphStatementcountVisitorTest >> traverse: aFlowGraphNode returns: aValue [
	| visitor |
	visitor := FASTJavaFlowGraphStatementCountVisitor new.
	visitor traverse: aFlowGraphNode.
	self assert: visitor statementCount equals: aValue
]
