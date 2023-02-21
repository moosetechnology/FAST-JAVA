"
A visitor computing control dependencies between statements in a FASTJavaMethodEntity.
It computes a control dependency graph as a collection of pairs: `#(parentNode dependentNode)`
"
Class {
	#name : #FASTJavaFlowGraphVisitor,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'currentNode',
		'variableAccumulator'
	],
	#category : #'FAST-Java-Tools-dependencies'
}

{ #category : #private }
FASTJavaFlowGraphVisitor >> acculmulateVariablesIn: aFASTNode [
	| allVariables |
	allVariables := Array streamContents: [ :stream |
		variableAccumulator := stream.
		aFASTNode accept: self.
	].

	"make sure we empty the accumulator (which is shared) before leaving"
	variableAccumulator := nil.
	^allVariables
]

{ #category : #private }
FASTJavaFlowGraphVisitor >> currentNode [
	^currentNode top
]

{ #category : #private }
FASTJavaFlowGraphVisitor >> currentNode: aFASTJavaFlowGraphNode [
	currentNode push: aFASTJavaFlowGraphNode.
	^aFASTJavaFlowGraphNode
]

{ #category : #private }
FASTJavaFlowGraphVisitor >> exitCurrentNode [
	^currentNode pop
]

{ #category : #private }
FASTJavaFlowGraphVisitor >> newNodeInBlock: aStatement after: lastNode [
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
	self currentNode
		defVariable: (self acculmulateVariablesIn: aFASTJavaAssignementExpression variable) anyOne.
	self currentNode
		refVariables: (self acculmulateVariablesIn: aFASTJavaAssignementExpression expression) asSet
]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	^aFASTJavaCastExpression expression accept: self
]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	variableAccumulator << aFASTJavaIdentifier localDeclaration
]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	self currentNode: (FASTJavaFlowGraphIfNode on: aFASTJavaIfStatement).

	self currentNode
		refVariables: (self acculmulateVariablesIn: aFASTJavaIfStatement condition) asSet.

	self currentNode addThenPart: (aFASTJavaIfStatement thenPart accept: self).

	aFASTJavaIfStatement elsePart ifNotNil: [ :elsePart |
			self currentNode addElsePart: (elsePart accept: self).
	].

	^self exitCurrentNode

]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTJavaVariableExpression: aFASTJavaVariableExpression [
	variableAccumulator << aFASTJavaVariableExpression localDeclaration
]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTTExpressionStatement: aFASTTExpressionStatement [
	self currentNode: (FASTJavaFlowGraphNode on: aFASTTExpressionStatement).

	self currentNode
		refVariables: (self acculmulateVariablesIn: aFASTTExpressionStatement expression) asSet.

	^self exitCurrentNode

]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTTStatement: aFASTStatement [
	"should not come to this, all statements should have their own visit methods"

	^FASTJavaFlowGraphNode on: aFASTStatement
]

{ #category : #visiting }
FASTJavaFlowGraphVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	"BlockStatement are not recorded in the Flow graph. Instead their first statement is"
	| lastNode |
	lastNode := nil.
	aFASTJavaStatementBlock statements do: [ :aStatement |
		lastNode
			ifNil: [
				lastNode := aStatement accept: self.
				self currentNode: lastNode
			]
			ifNotNil: [ lastNode := self newNodeInBlock: aStatement after: lastNode ]
	].
	^self exitCurrentNode asFirstNodeInBlock
]
