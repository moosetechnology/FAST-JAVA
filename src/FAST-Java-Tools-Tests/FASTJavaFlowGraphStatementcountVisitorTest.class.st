Class {
	#name : #FASTJavaFlowGraphStatementcountVisitorTest,
	#superclass : #FASTJavaFlowGraphAbstractVisitorTest,
	#category : #'FAST-Java-Tools-Tests-flowgraph'
}

{ #category : #tests }
FASTJavaFlowGraphStatementcountVisitorTest >> testTraverseBlockNode [
	self traverse: blockNode returns: 2
]

{ #category : #tests }
FASTJavaFlowGraphStatementcountVisitorTest >> testTraverseBlockWithTwoNodesAndIfNodeAndOtherNode [
	"{ node1 -> node2 -> ifNode -> otherNode }
	and ifNode contains only simpleNode in its THEN part"
	| otherNode |
	otherNode := FASTJavaFlowGraphNode new
		statement: 'other stmt' ;
		yourself.
	ifNode thenPart: simpleNode.
	blockNode addNode: ifNode.
	blockNode addNode: otherNode.
	
	self traverse: blockNode  returns: 5
]

{ #category : #tests }
FASTJavaFlowGraphStatementcountVisitorTest >> testTraverseIfNodeWithThen [
	ifNode thenPart: blockNode.
	self traverse: ifNode  returns: 3
]

{ #category : #tests }
FASTJavaFlowGraphStatementcountVisitorTest >> testTraverseIfNodeWithThenAndElse [
	| otherNode |
	otherNode := FASTJavaFlowGraphNode new
		statement: 'other stmt' ;
		yourself.
	ifNode thenPart: blockNode.
	ifNode elsePart: otherNode.
	self traverse: ifNode  returns: 4
]

{ #category : #tests }
FASTJavaFlowGraphStatementcountVisitorTest >> testTraverseSimpleNode [
	self traverse: simpleNode returns: 1
]

{ #category : #running }
FASTJavaFlowGraphStatementcountVisitorTest >> traverse: aFlowGraphNode returns: aValue [
	| visitor |
	visitor := FASTJavaFlowGraphStatementCountVisitor new.
	visitor traverse: aFlowGraphNode.
	self assert: visitor statementCount equals: aValue
]
