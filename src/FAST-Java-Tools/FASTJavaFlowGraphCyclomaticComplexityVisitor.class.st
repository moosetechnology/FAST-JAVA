"
A flow graph visitor that computes the cyclomatic complexity of the flow graph

Not really interesting, but useful for tests
"
Class {
	#name : #FASTJavaFlowGraphCyclomaticComplexityVisitor,
	#superclass : #FASTJavaFlowGraphAbstractVisitor,
	#instVars : [
		'complexity'
	],
	#category : #'FAST-Java-Tools-flowgraph'
}

{ #category : #accessing }
FASTJavaFlowGraphCyclomaticComplexityVisitor >> complexity [ 
	^complexity
]

{ #category : #traversing }
FASTJavaFlowGraphCyclomaticComplexityVisitor >> traverse: aFlowGraphNode [
	complexity := 1.
	^super traverse: aFlowGraphNode 
]

{ #category : #traversing }
FASTJavaFlowGraphCyclomaticComplexityVisitor >> visitFlowGraphIfNode: aFlowGraphIfNode [
	complexity := complexity + 1.
	^super visitFlowGraphIfNode: aFlowGraphIfNode
]
