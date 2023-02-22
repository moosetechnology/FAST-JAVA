"
A flow graph visitor that counts the number of statements in the flow graph

Not really interesting, but useful for tests
"
Class {
	#name : #FASTJavaFlowGraphStatementCountVisitor,
	#superclass : #FASTJavaFlowGraphAbstractVisitor,
	#instVars : [
		'count'
	],
	#category : #'FAST-Java-Tools-flowgraph'
}

{ #category : #traversing }
FASTJavaFlowGraphStatementCountVisitor >> traverse: aFlowGraphNode [
	count := 0.
	^super traverse: aFlowGraphNode 
]

{ #category : #traversing }
FASTJavaFlowGraphStatementCountVisitor >> visitFlowGraphNode: aFlowGraphNode [
	count := count + 1.
	^super visitFlowGraphNode: aFlowGraphNode
]
