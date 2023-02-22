Class {
	#name : #FASTJavaFlowGraphAbstractVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'ifnode',
		'blockNode',
		'simpleNode'
	],
	#category : #'FAST-Java-Tools-Tests-flowgraph'
}

{ #category : #running }
FASTJavaFlowGraphAbstractVisitorTest >> setUp [
	super setUp.
	
	simpleNode := FASTJavaFlowGraphNode new
		statement: 'simple node' ;
		yourself.
	blockNode := FASTJavaFlowGraphNode new
		statement: '1st in block' ;
		addSuccessor: (FASTJavaFlowGraphNode new
			statement: '2nd in block' ;
			yourself) ;
		asFirstNodeInBlock.

	ifnode := FASTJavaFlowGraphIfNode new
		statement: 'if node' ;
		yourself.
		
	 
	
]
