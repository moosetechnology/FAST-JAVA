"
A visitor computing control dependencies between statements in a FASTJavaMethodEntity.
It computes a control dependency graph as a collection of pairs: `#(parentNode dependentNode)`
"
Class {
	#name : #FASTJavaFlowGraphVisitor,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'currentNode'
	],
	#category : #'FAST-Java-Tools-dependencies'
}

{ #category : #accessing }
FASTJavaFlowGraphVisitor >> currentNode [
	^currentNode top
]

{ #category : #accessing }
FASTJavaFlowGraphVisitor >> currentNode: aFASTJavaFlowGraphNode [
	currentNode push: aFASTJavaFlowGraphNode.
	^aFASTJavaFlowGraphNode
]

{ #category : #accessing }
FASTJavaFlowGraphVisitor >> exitCurrentNode [
	^currentNode pop
]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> newNode: aStatement after: lastNode [
	| newNode |
	newNode := aStatement accept: self.
	lastNode addSuccessor: newNode.
	^newNode
]

{ #category : #api }
FASTJavaFlowGraphVisitor >> sdg: aFASTJavaNode [
	currentNode := Stack new.
	^aFASTJavaNode accept: self
]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	self currentNode: (FASTJavaFlowGraphIfNode on: aFASTJavaIfStatement).

	aFASTJavaIfStatement condition accept: self.

	self currentNode addThenPart: (aFASTJavaIfStatement thenPart accept: self).

	aFASTJavaIfStatement elsePart ifNotNil: [ :elsePart |
			currentNode addElsePart: (elsePart accept: self).
	].
	^self exitCurrentNode

]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTTStatement: aFASTStatement [
	^FASTJavaFlowGraphNode on: aFASTStatement
]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	| lastNode |
	lastNode := true.
	aFASTJavaStatementBlock statements do: [ :aStatement |
		lastNode
			ifNil: [
				lastNode := aStatement accept: self.
				self currentNode: lastNode
			]
			ifNotNil: [ lastNode := self newNode: aStatement after: lastNode ]
	].
	^self exitCurrentNode asFirstNodeInBlock
]
