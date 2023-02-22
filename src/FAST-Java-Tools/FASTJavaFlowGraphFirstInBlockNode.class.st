"
A flowGraphNode that represents the first statement in a block (since blocks themselves are not represented in the flow graph)
They have a reference to the last statement in the block and any successor of the block will be set as a successor of the last statement.

"
Class {
	#name : #FASTJavaFlowGraphFirstInBlockNode,
	#superclass : #FASTJavaFlowGraphNode,
	#instVars : [
		'lastInBlock'
	],
	#category : #'FAST-Java-Tools-flowgraph'
}

{ #category : #traversing }
FASTJavaFlowGraphFirstInBlockNode >> accept: visitor [
	^(self acceptToEnd: visitor)
		ifTrue: [ lastInBlock successorsAccept: visitor ]
		ifFalse: [ false ]
]

{ #category : #traversing }
FASTJavaFlowGraphFirstInBlockNode >> accept: visitor toEnd: lastStatementInBlock [
	"visit only up to the `lastStatementInBlock`"
	^((visitor visitFlowGraphBlockNode: self) and:
	[self ~= lastStatementInBlock])
		ifTrue: [ self successorsAccept: visitor ]
		ifFalse: [ false ]
]

{ #category : #traversing }
FASTJavaFlowGraphFirstInBlockNode >> acceptToEnd: visitor [
	"traverse only to the end of the block"
	^self accept: visitor toEnd: lastInBlock
]

{ #category : #adding }
FASTJavaFlowGraphFirstInBlockNode >> addSuccessor: aFlowGraphNode [
	"successor of the block is set as the successor of the last statement of the block
	 if there is only 1 statement in the block (lastInblock = self), avoid infinite recursive call"
	(lastInBlock == self)
	ifTrue:  [
		lastInBlock primitiveAddSuccessor: aFlowGraphNode.
		aFlowGraphNode primitiveAddPredecessor: lastInBlock ]
	ifFalse: [ lastInBlock addSuccessor: aFlowGraphNode ]
]

{ #category : #converting }
FASTJavaFlowGraphFirstInBlockNode >> asFirstNodeInBlock [
	lastInBlock := self.
	[ lastInBlock successors isEmpty ]
		whileFalse: [ lastInBlock := lastInBlock successors anyOne ].
	
	^self
]

{ #category : #initialization }
FASTJavaFlowGraphFirstInBlockNode >> initialize [ 
	super initialize.

	lastInBlock := self
]

{ #category : #testing }
FASTJavaFlowGraphFirstInBlockNode >> isBlockNode [
	^true
]

{ #category : #'private -testing' }
FASTJavaFlowGraphFirstInBlockNode >> lastInBlock [

	^ lastInBlock
]
