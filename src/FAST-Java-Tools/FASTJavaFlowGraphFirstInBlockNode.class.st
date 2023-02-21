"
A flowGraphNode that represents the first statement in a block (since blocks themselves are not represented in the flow graph)
They have a reference to the last statement in the block and any successor of the block will be set as a successor of the last statement
"
Class {
	#name : #FASTJavaFlowGraphFirstInBlockNode,
	#superclass : #FASTJavaFlowGraphNode,
	#instVars : [
		'lastInblock'
	],
	#category : #'FAST-Java-Tools-dependencies'
}

{ #category : #adding }
FASTJavaFlowGraphFirstInBlockNode >> addSuccessor: aFlowGraphNode [
	"successor of the block is set as the successor of the last statement of the block
	 if there is only 1 statement in the block (lastInblock = self), avoid infinite recursive call"
	(lastInblock = self)
	ifTrue:  [
		lastInblock primitiveAddSuccessor: aFlowGraphNode.
		aFlowGraphNode primitiveAddPredecessor: lastInblock ]
	ifFalse: [ lastInblock addSuccessor: aFlowGraphNode ]
]

{ #category : #converting }
FASTJavaFlowGraphFirstInBlockNode >> asFirstNodeInBlock [
	^self
]

{ #category : #initialization }
FASTJavaFlowGraphFirstInBlockNode >> initialize [ 
	super initialize.

	lastInblock := self
]

{ #category : #testing }
FASTJavaFlowGraphFirstInBlockNode >> isBlockNode [
	^true
]

{ #category : #traversing }
FASTJavaFlowGraphFirstInBlockNode >> traverse: visitor [
	"traverse only the statements in the block,
	if there is a successor to the block, its 'parent' should take care of traversing it
	by calling #traverseSuccessors:"
	self traverse: visitor stoppingAt: lastInblock
]

{ #category : #traversing }
FASTJavaFlowGraphFirstInBlockNode >> traverse: visitor stoppingAt: lastStatementInBlock [
	"traverse only the statements in the block, until the lastStatementInBlock"
	visitor visit: self.
	(self == lastStatementInBlock)
		ifFalse: [ self traverseSuccessors: visitor ]
]

{ #category : #traversing }
FASTJavaFlowGraphFirstInBlockNode >> traverseSuccessor: visitor [
	"#traverse: only goes through the statements in the block,
	this methods goes after the last statement of the block"
	lastInblock traverseSuccessors: visitor
]
