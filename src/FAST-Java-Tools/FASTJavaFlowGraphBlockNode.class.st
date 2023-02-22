"
A flowGraphNode that represents a statement block

It contains no statement, knows its first and last nodes (corresponding to first and last statements) and has for successors the node containing the statement after its last node's statememt

"
Class {
	#name : #FASTJavaFlowGraphBlockNode,
	#superclass : #FASTJavaFlowGraphNode,
	#instVars : [
		'firstNode',
		'lastNode'
	],
	#category : #'FAST-Java-Tools-flowgraph'
}

{ #category : #traversing }
FASTJavaFlowGraphBlockNode >> accept: visitor [
	^visitor visitFlowGraphBlockNode: self
]

{ #category : #accessing }
FASTJavaFlowGraphBlockNode >> addNode: aFlowGraphNode [
	firstNode
		ifNil: [ self firstNode: aFlowGraphNode ]
		ifNotNil: [
			lastNode addSuccessor: aFlowGraphNode.
			lastNode := aFlowGraphNode 
		]
]

{ #category : #accessing }
FASTJavaFlowGraphBlockNode >> firstNode [

	^ firstNode
]

{ #category : #accessing }
FASTJavaFlowGraphBlockNode >> firstNode: aFlowGraphNode [

	firstNode := aFlowGraphNode.
	lastNode := aFlowGraphNode 
]
