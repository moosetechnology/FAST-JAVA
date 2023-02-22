"
A flow graph visitor that computes the cyclomatic complexity of the flow graph

Not really interesting, but useful for tests
"
Class {
	#name : #FASTJavaFlowGraphCyclomatiComplexityVisitor,
	#superclass : #FASTJavaFlowGraphAbstractVisitor,
	#instVars : [
		'complexity'
	],
	#category : #'FAST-Java-Tools-flowgraph'
}

{ #category : #traversing }
FASTJavaFlowGraphCyclomatiComplexityVisitor >> traverse: aFlowGraphNode [
	complexity := 1.
	^super traverse: aFlowGraphNode 
]

{ #category : #traversing }
FASTJavaFlowGraphCyclomatiComplexityVisitor >> visitFlowGraphIfNode: aFlowGraphIfNode [
	complexity := complexity + 1.
	^super visitFlowGraphIfNode: aFlowGraphIfNode
]
