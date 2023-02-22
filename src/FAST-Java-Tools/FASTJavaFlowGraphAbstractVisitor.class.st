"
A visitor to traverse a FASTJavaFlowGraph

Traversal continues as long as visiting a node returns TRUE
Traversal is kind-a breadth first because both THEN and ELSE parts of a IF are traversed before traversing the successors of the IF
"
Class {
	#name : #FASTJavaFlowGraphAbstractVisitor,
	#superclass : #FASTJavaVisitor,
	#category : #'FAST-Java-Tools-dependencies'
}

{ #category : #traversing }
FASTJavaFlowGraphAbstractVisitor >> traverse: aFlowGraphNode [
	^aFlowGraphNode accept: self
]

{ #category : #traversing }
FASTJavaFlowGraphAbstractVisitor >> visitFlowGraphBlockNode: aFlowGraphFirstInBlockNode [
	^self visitFlowGraphNode: aFlowGraphFirstInBlockNode
]

{ #category : #traversing }
FASTJavaFlowGraphAbstractVisitor >> visitFlowGraphIfNode: aFlowGraphIfNode [
	^self visitFlowGraphNode: aFlowGraphIfNode
]

{ #category : #traversing }
FASTJavaFlowGraphAbstractVisitor >> visitFlowGraphNode: aFlowGraphNode [
	^true
]
