"
A node in a flowgraph. Each node corresponds to a FAST statement.

A node has:
- its FAST `#statement`
- `predecessors` and `successors` (FlowGraphNodes) in the flow graph (not in API)
- the FAST variables that are read (`#refVariables`) or written (`#defVariable`) in the FAST statement
- `#accept:` method to allow a visitor to traverse the flow graph
"
Class {
	#name : #FASTJavaFlowGraphNode,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'predecessors',
		'successors',
		'statement',
		'refs',
		'def',
		'slice'
	],
	#category : #'FAST-Java-Tools-flowgraph'
}

{ #category : #'instance creation' }
FASTJavaFlowGraphNode class >> on: aFASTStatement [
	^self new
		statement: aFASTStatement ;
		yourself
]

{ #category : #visiting }
FASTJavaFlowGraphNode >> accept: visitor [
	"returns whether the graph traversal should continue or not"
	^visitor visitFlowGraphNode: self

]

{ #category : #accessing }
FASTJavaFlowGraphNode >> addRefVariable: aVariable [

	refs add: aVariable
]

{ #category : #accessing }
FASTJavaFlowGraphNode >> addSuccessor: aFlowGraphNode [
	self primitiveAddSuccessor: aFlowGraphNode.
	aFlowGraphNode primitiveAddPredecessor: self
]

{ #category : #accessing }
FASTJavaFlowGraphNode >> defVariable [

	^ def
]

{ #category : #accessing }
FASTJavaFlowGraphNode >> defVariable: anObject [

	def := anObject
]

{ #category : #initialization }
FASTJavaFlowGraphNode >> initialize [ 
	super initialize.
	
	predecessors := OrderedCollection new.
	successors := OrderedCollection new.
	refs := OrderedCollection new.
]

{ #category : #accessing }
FASTJavaFlowGraphNode >> predecessors [
	^predecessors
]

{ #category : #accessing }
FASTJavaFlowGraphNode >> predecessors: aCollection [
	predecessors := aCollection
]

{ #category : #private }
FASTJavaFlowGraphNode >> primitiveAddPredecessor: aFlowGraphNode [
	predecessors add: aFlowGraphNode
]

{ #category : #private }
FASTJavaFlowGraphNode >> primitiveAddSuccessor: aFlowGraphNode [
	successors add: aFlowGraphNode.
]

{ #category : #accessing }
FASTJavaFlowGraphNode >> refVariables [

	^ refs
]

{ #category : #accessing }
FASTJavaFlowGraphNode >> refVariables: aCollection [

	refs := aCollection
]

{ #category : #accessing }
FASTJavaFlowGraphNode >> statement [

	^ statement
]

{ #category : #accessing }
FASTJavaFlowGraphNode >> statement: anObject [

	statement := anObject
]

{ #category : #accessing }
FASTJavaFlowGraphNode >> successors [
	^successors
]

{ #category : #accessing }
FASTJavaFlowGraphNode >> successors: aCollection [
	successors := aCollection
]

{ #category : #visiting }
FASTJavaFlowGraphNode >> successorsAccept: visitor [
	"returns TRUE (continue visit) only if all successors return TRUE"
	^self successors allSatisfy: [ :succ | succ accept: visitor ]
]
