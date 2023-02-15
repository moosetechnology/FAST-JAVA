"
A visitor computing control dependencies between statements in a FASTJavaMethodEntity.
It computes a control dependency graph as a collection of pairs: `#(parentNode dependentNode)`
"
Class {
	#name : #FASTJavaFlowGraphVisitor,
	#superclass : #FASTJavaVisitor,
	#category : #'FAST-Java-Tools-dependencies'
}

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> newNode: aStatement after: lastNode [
	| newNode |
	newNode := aStatement accept: self.
	lastNode addSuccessor: newNode.
	^newNode
]

{ #category : #api }
FASTJavaFlowGraphVisitor >> sdg: aFASTJavaNode [
	^aFASTJavaNode accept: self
]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	| mainNode |
	mainNode := FASTJavaFlowGraphIfNode on: aFASTJavaIfStatement.
	mainNode addThenPart: (aFASTJavaIfStatement thenPart accept: self).
	aFASTJavaIfStatement elsePart ifNotNil: [ :elsePart |
			mainNode addElsePart: (elsePart accept: self).
	].
	^mainNode

]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTTStatement: aFASTStatement [
	^FASTJavaFlowGraphNode on: aFASTStatement
]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	| firstNode lastNode |
	firstNode := nil.
	aFASTJavaStatementBlock statements do: [ :aStatement |
		firstNode
			ifNil: [ firstNode := lastNode := aStatement accept: self ]
			ifNotNil: [ lastNode := self newNode: aStatement after: lastNode ]
	].
	^firstNode asFirstNodeInBlock
]
