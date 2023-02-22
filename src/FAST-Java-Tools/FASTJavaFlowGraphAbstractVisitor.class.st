"
A visitor to traverse a FASTJavaFlowGraph

Traversal continues as long as visiting a node returns TRUE
Traversal is kind-a breadth first because both THEN and ELSE parts of a IF are traversed before traversing the successors of the IF
"
Class {
	#name : #FASTJavaFlowGraphAbstractVisitor,
	#superclass : #FASTJavaVisitor,
	#category : #'FAST-Java-Tools-flowgraph'
}

{ #category : #traversing }
FASTJavaFlowGraphAbstractVisitor >> traverse: aFlowGraphNode [
	^aFlowGraphNode accept: self
]

{ #category : #traversing }
FASTJavaFlowGraphAbstractVisitor >> visitFlowGraphBlockNode: aFlowGraphBlockNode [
	^(aFlowGraphBlockNode firstNode accept: self)
		ifTrue: [ aFlowGraphBlockNode successorsAccept: self ]
		ifFalse: [ false ]
]

{ #category : #traversing }
FASTJavaFlowGraphAbstractVisitor >> visitFlowGraphIfNode: aFlowGraphIfNode [
	(aFlowGraphIfNode thenPart accept: self) ifFalse: [ ^ false ].
	aFlowGraphIfNode elsePart
		ifNotNil: [ :elsePart | (elsePart accept: self) ifFalse: [ ^ false ] ].
	^aFlowGraphIfNode successorsAccept: self
]

{ #category : #traversing }
FASTJavaFlowGraphAbstractVisitor >> visitFlowGraphNode: aFlowGraphNode [
	^aFlowGraphNode successorsAccept: self
]
