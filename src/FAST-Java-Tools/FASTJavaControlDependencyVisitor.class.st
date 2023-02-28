"
A visitor to compute the flowgraph of a FAST method
"
Class {
	#name : #FASTJavaControlDependencyVisitor,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'edges',
		'edgeSource'
	],
	#category : #'FAST-Java-Tools-dependencies'
}

{ #category : #private }
FASTJavaControlDependencyVisitor >> edge: aParentNode to: aDependingNode [
	edges nextPut: { aParentNode . aDependingNode }
]

{ #category : #private }
FASTJavaControlDependencyVisitor >> edgeTo: aTargetNode [
	edges nextPut: { edgeSource . aTargetNode }
]

{ #category : #api }
FASTJavaControlDependencyVisitor >> sdg: aFASTJavaNode [
	^OrderedCollection streamContents: [ :stream |
		edges := stream.
		edgeSource := Stack new.
		self visit: aFASTJavaNode
	]
]

{ #category : #visiting }
FASTJavaControlDependencyVisitor >> visit: aFASTJavaNode [
	"helper that manages the visited node as source of the control flow edges"
	edgeSource push: aFASTJavaNode.
	aFASTJavaNode accept: self.
	edgeSource pop
]

{ #category : #visiting }
FASTJavaControlDependencyVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	self edge: aFASTJavaIfStatement to: aFASTJavaIfStatement thenPart.
	aFASTJavaIfStatement thenPart accept: self.

	aFASTJavaIfStatement elsePart ifNotNil: [ :elsePart |
		self edge: aFASTJavaIfStatement to: elsePart.
		elsePart accept: self
	] 

]

{ #category : #visiting }
FASTJavaControlDependencyVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	aFASTJavaStatementBlock statements do: [ :dependingNode |
			self edgeTo: dependingNode.

			"here, we do not call 'self visit:' because we don't want the statement block
			 to appear in the dependencies, but only 'actual' statements"
			dependingNode accept: self
	]

]
