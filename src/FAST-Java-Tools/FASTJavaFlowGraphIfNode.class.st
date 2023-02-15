Class {
	#name : #FASTJavaFlowGraphIfNode,
	#superclass : #FASTJavaFlowGraphNode,
	#category : #'FAST-Java-Tools-dependencies'
}

{ #category : #adding }
FASTJavaFlowGraphIfNode >> addElsePart: aFlowGraphNode [
	"happens when visiting the ELSE part of the IF statement"
	self primitiveAddSuccessor: aFlowGraphNode.
	aFlowGraphNode primitiveAddPredecessor: self.
]

{ #category : #adding }
FASTJavaFlowGraphIfNode >> addSuccessor: aFlowGraphNode [
	successors first addSuccessor: aFlowGraphNode.
	self addSuccessorToElse: aFlowGraphNode
]

{ #category : #adding }
FASTJavaFlowGraphIfNode >> addSuccessorNoElse: aFlowGraphNode [
	"if there is no ELSE part, the next statement is successor of the IF statement itself"
	self addElsePart: aFlowGraphNode
]

{ #category : #adding }
FASTJavaFlowGraphIfNode >> addSuccessorToElse: aFlowGraphNode [
	(successors size = 2)
	ifTrue: [ "else part"
		successors second addSuccessor: aFlowGraphNode.
	]
	ifFalse: [
		self addSuccessorNoElse: aFlowGraphNode
	]
]

{ #category : #adding }
FASTJavaFlowGraphIfNode >> addThenPart: aFlowGraphNode [
	"happens when visiting the THEN part of the IF statement"
	self primitiveAddSuccessor: aFlowGraphNode.
	aFlowGraphNode primitiveAddPredecessor: self.
]

{ #category : #converting }
FASTJavaFlowGraphIfNode >> asFirstNodeInBlock [
	^self
]
