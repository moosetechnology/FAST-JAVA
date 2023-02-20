Class {
	#name : #FASTJavaFlowGraphNode,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'predecessors',
		'successors',
		'statement',
		'refs',
		'def'
	],
	#category : #'FAST-Java-Tools-dependencies'
}

{ #category : #'instance creation' }
FASTJavaFlowGraphNode class >> on: aFASTStatement [
	^self new
		statement: aFASTStatement ;
		yourself
]

{ #category : #adding }
FASTJavaFlowGraphNode >> addPredecessor: aFlowGraphNode [
	self primitiveAddPredecessor: aFlowGraphNode.
	aFlowGraphNode primitiveAddSuccessor: self
]

{ #category : #accessing }
FASTJavaFlowGraphNode >> addRefVariable: aVariable [

	refs add: aVariable
]

{ #category : #adding }
FASTJavaFlowGraphNode >> addSuccessor: aFlowGraphNode [
	self primitiveAddSuccessor: aFlowGraphNode.
	aFlowGraphNode primitiveAddPredecessor: self
]

{ #category : #converting }
FASTJavaFlowGraphNode >> asFirstNodeInBlock [
	| newNode |
	newNode := FASTJavaFlowGraphFirstInBlockNode on: self statement.
	newNode predecessors: predecessors.
	predecessors do: [ :pred |
		pred primitiveRemoveSuccessor: self.
		pred primitiveAddSuccessor: newNode ].

	newNode successors: successors.
	successors do: [ :succ |
		succ primitiveRemovePredecessor: self.
		succ primitiveAddPredecessor: newNode ].

	^newNode
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

{ #category : #adding }
FASTJavaFlowGraphNode >> predecessors [
	^predecessors
]

{ #category : #adding }
FASTJavaFlowGraphNode >> predecessors: aCollection [
	predecessors := aCollection
]

{ #category : #adding }
FASTJavaFlowGraphNode >> primitiveAddPredecessor: aFlowGraphNode [
	predecessors add: aFlowGraphNode
]

{ #category : #adding }
FASTJavaFlowGraphNode >> primitiveAddSuccessor: aFlowGraphNode [
	successors add: aFlowGraphNode.
]

{ #category : #adding }
FASTJavaFlowGraphNode >> primitiveRemovePredecessor: aFlowGraphNode [
	predecessors remove: aFlowGraphNode
]

{ #category : #adding }
FASTJavaFlowGraphNode >> primitiveRemoveSuccessor: aFlowGraphNode [
	successors remove: aFlowGraphNode
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

{ #category : #adding }
FASTJavaFlowGraphNode >> successors [
	^successors
]

{ #category : #adding }
FASTJavaFlowGraphNode >> successors: aCollection [
	successors := aCollection
]
