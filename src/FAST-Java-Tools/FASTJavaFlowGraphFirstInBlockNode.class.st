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
	lastInblock addSuccessor: aFlowGraphNode.
	lastInblock := aFlowGraphNode

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
