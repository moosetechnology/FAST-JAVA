Class {
	#name : #FASTJavaFlowGraphCyclomaticComplexityVisitorTest,
	#superclass : #FASTJavaFlowGraphAbstractVisitorTest,
	#category : #'FAST-Java-Tools-Tests-flowgraph'
}

{ #category : #tests }
FASTJavaFlowGraphCyclomaticComplexityVisitorTest >> testTraverseBlockNode [
	self traverse: blockNode returns: 1
]

{ #category : #tests }
FASTJavaFlowGraphCyclomaticComplexityVisitorTest >> testTraverseBlockWithTwoNodesAndTwoIfNodes [
	"{ node1 -> node2 -> ifNode -> otherIfNode }
	and ifNodes contain only simpleNodes in their THEN part"
	| otherIfNode |
	otherIfNode := FASTJavaFlowGraphIfNode new
		statement: 'other if stmt' ;
		thenPart: (FASTJavaFlowGraphNode new
			statement: 'other-if then part' ;
			yourself) ;
		yourself.
	ifNode thenPart: simpleNode.
	blockNode addNode: ifNode.
	blockNode addNode: otherIfNode.
	
	self traverse: blockNode  returns: 3
]

{ #category : #tests }
FASTJavaFlowGraphCyclomaticComplexityVisitorTest >> testTraverseIfNodeWithThen [
	ifNode thenPart: blockNode.
	self traverse: ifNode  returns: 2
]

{ #category : #tests }
FASTJavaFlowGraphCyclomaticComplexityVisitorTest >> testTraverseIfNodeWithThenAndElse [
	| otherNode |
	otherNode := FASTJavaFlowGraphNode new
		statement: 'other stmt' ;
		yourself.
	ifNode thenPart: blockNode.
	ifNode elsePart: otherNode.
	self traverse: ifNode  returns: 2
]

{ #category : #tests }
FASTJavaFlowGraphCyclomaticComplexityVisitorTest >> testTraverseIfNodeWithThenAndElseWithOtherIf [
	| otherIfNode |
	otherIfNode := FASTJavaFlowGraphIfNode new
		statement: 'other if stmt' ;
		thenPart: (FASTJavaFlowGraphNode new
			statement: 'other-if then part' ;
			yourself) ;
		yourself.
	ifNode thenPart: blockNode.
	ifNode elsePart: otherIfNode.
	self traverse: ifNode  returns: 3
]

{ #category : #tests }
FASTJavaFlowGraphCyclomaticComplexityVisitorTest >> testTraverseSimpleNode [
	self traverse: simpleNode returns: 1
]

{ #category : #running }
FASTJavaFlowGraphCyclomaticComplexityVisitorTest >> traverse: aFlowGraphNode returns: aValue [
	| visitor |
	visitor := FASTJavaFlowGraphCyclomaticComplexityVisitor new.
	visitor traverse: aFlowGraphNode.
	self assert: visitor complexity equals: aValue
]
