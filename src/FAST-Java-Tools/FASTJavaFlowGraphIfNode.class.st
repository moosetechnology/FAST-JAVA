"
A FlowGraphNode for an IF statement

It is needed to treat adequatly the THEN and ELSE parts
"
Class {
	#name : #FASTJavaFlowGraphIfNode,
	#superclass : #FASTJavaFlowGraphNode,
	#category : #'FAST-Java-Tools-flowgraph'
}

{ #category : #traversing }
FASTJavaFlowGraphIfNode >> accept: visitor [

	"visit the node itself, THEN part, ELSE part. If they all return TRUE,
	then visit successors of THEN part (which are the same as successors of ELSE part)"

	(visitor visitFlowGraphIfNode: self) ifFalse: [ ^ false ].
	(self thenPartAccept: visitor) ifFalse: [ ^ false ].
	(self elsePartAccept: visitor) ifFalse: [ ^ false ].
	(self thenPart successorsAccept: visitor) ifFalse: [ ^ false ].
	^ true
]

{ #category : #adding }
FASTJavaFlowGraphIfNode >> addElsePart: aFlowGraphNode [
	"ELSE part is 2nd successor of IF statement"
	self primitiveAddSuccessor: aFlowGraphNode.
	aFlowGraphNode primitiveAddPredecessor: self.
]

{ #category : #adding }
FASTJavaFlowGraphIfNode >> addSuccessor: aFlowGraphNode [
	self thenPart addSuccessor: aFlowGraphNode.
	self elsePart
		ifNil: [ self addElsePart: aFlowGraphNode ]
		ifNotNil: [ :elsePart | elsePart addSuccessor: aFlowGraphNode ]
]

{ #category : #adding }
FASTJavaFlowGraphIfNode >> addThenPart: aFlowGraphNode [
	"THEN part is first successor of IF statement"
	self primitiveAddSuccessor: aFlowGraphNode.
	aFlowGraphNode primitiveAddPredecessor: self.
]

{ #category : #converting }
FASTJavaFlowGraphIfNode >> asFirstNodeInBlock [
	^self
]

{ #category : #accessing }
FASTJavaFlowGraphIfNode >> elsePart [

	^(self successors size == 2)
		ifTrue: [ self successors second ]
		ifFalse: [ nil ]
]

{ #category : #traversing }
FASTJavaFlowGraphIfNode >> elsePartAccept: visitor [
	"traverse ELSE part only, not its successors"
	^self elsePart
		ifNil:  [ true ]
		ifNotNil: [ :elsePart |
			elsePart isBlockNode
				ifTrue: [ self elsePart acceptToEnd: visitor ]
				ifFalse: [ self elsePart accept: visitor ]
		]
]

{ #category : #accessing }
FASTJavaFlowGraphIfNode >> thenPart [

	^ self successors first
]

{ #category : #traversing }
FASTJavaFlowGraphIfNode >> thenPartAccept: visitor [
	"traverse THEN part only, not its successors"
	^self thenPart isBlockNode
		ifTrue: [ self thenPart acceptToEnd: visitor ]
		ifFalse: [ self thenPart accept: visitor ]
]
