"
A FlowGraphNode for an IF statement

The IF node has 2 successors, its THEN and ELSE parts
The node with the satement just after the IF statement will be successor of both the last node of THEN part and ELSE part
"
Class {
	#name : #FASTJavaFlowGraphIfNode,
	#superclass : #FASTJavaFlowGraphNode,
	#instVars : [
		'thenPart',
		'elsePart'
	],
	#category : #'FAST-Java-Tools-flowgraph'
}

{ #category : #visiting }
FASTJavaFlowGraphIfNode >> accept: visitor [

	^visitor visitFlowGraphIfNode: self
]

{ #category : #accessing }
FASTJavaFlowGraphIfNode >> elsePart [
	^elsePart
]

{ #category : #adding }
FASTJavaFlowGraphIfNode >> elsePart: aFlowGraphNode [
	elsePart := aFlowGraphNode
]

{ #category : #accessing }
FASTJavaFlowGraphIfNode >> thenPart [

	^ thenPart 
]

{ #category : #adding }
FASTJavaFlowGraphIfNode >> thenPart: aFlowGraphNode [
	thenPart := aFlowGraphNode
]
