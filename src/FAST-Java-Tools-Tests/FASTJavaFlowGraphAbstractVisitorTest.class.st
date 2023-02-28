Class {
	#name : #FASTJavaFlowGraphAbstractVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'blockNode',
		'simpleNode',
		'ifNode'
	],
	#category : #'FAST-Java-Tools-Tests-flowgraph'
}

{ #category : #running }
FASTJavaFlowGraphAbstractVisitorTest >> setUp [
	super setUp.

	simpleNode := FASTJavaFlowGraphNode new
		statement: 'simple node' ;
		yourself.
	blockNode := FASTJavaFlowGraphBlockNode new
		addNode: (FASTJavaFlowGraphNode new
			statement: '1st in block' ;
			yourself) ;
		addNode: (FASTJavaFlowGraphNode new
			statement: '2nd in block' ;
			yourself) ;
		yourself.

	ifNode := FASTJavaFlowGraphIfNode new.
		
	 
	
]
