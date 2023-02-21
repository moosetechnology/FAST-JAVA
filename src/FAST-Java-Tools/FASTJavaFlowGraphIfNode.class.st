"
A FlowGraphNode for an IF statement

It is needed to treat adequatly the THEN and ELSE parts
"
Class {
	#name : #FASTJavaFlowGraphIfNode,
	#superclass : #FASTJavaFlowGraphNode,
	#category : #'FAST-Java-Tools-dependencies'
}

{ #category : #adding }
FASTJavaFlowGraphIfNode >> addElsePart: aFlowGraphNode [
	"ELSE part is 2nd successor of IF statement"
	self primitiveAddSuccessor: aFlowGraphNode.
	aFlowGraphNode primitiveAddPredecessor: self.
]

{ #category : #adding }
FASTJavaFlowGraphIfNode >> addSuccessor: aFlowGraphNode [
	self addSuccessorToThen: aFlowGraphNode.
	self addSuccessorToElse: aFlowGraphNode
]

{ #category : #adding }
FASTJavaFlowGraphIfNode >> addSuccessorToElse: aFlowGraphNode [
	"ELSE part (when it exists) is 2nd successor of IF
	 when there is no ELSE part, aFlowGraphNode becomes 2nd successor of the IF statement itself"
	(successors size = 2)
	ifTrue: [
		successors second addSuccessor: aFlowGraphNode.
	]
	ifFalse: [
		self addElsePart: aFlowGraphNode
	]
]

{ #category : #adding }
FASTJavaFlowGraphIfNode >> addSuccessorToThen: aFlowGraphNode [
	"THEN part is 1st successor of IF statement"
	successors first addSuccessor: aFlowGraphNode
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
