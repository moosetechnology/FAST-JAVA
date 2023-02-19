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
FASTJavaFlowGraphVisitor >> visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression [
self flag: #todo.
	aFASTJavaAssignementExpression variable accept: self.
	aFASTJavaAssignementExpression expression accept: self
]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	self currentNode: (FASTJavaFlowGraphIfNode on: aFASTJavaIfStatement).

	aFASTJavaIfStatement condition accept: self.

	self currentNode addThenPart: (aFASTJavaIfStatement thenPart accept: self).

	aFASTJavaIfStatement elsePart ifNotNil: [ :elsePart |
			self currentNode addElsePart: (elsePart accept: self).
	].
	^self exitCurrentNode

]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTTStatement: aFASTStatement [
	"should not come to this, all statements should have their own visit methods"

	^FASTJavaFlowGraphNode on: aFASTStatement
]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	| lastNode |
	lastNode := nil.
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
