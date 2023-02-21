Class {
	#name : #FASTJavaSlicer,
	#superclass : #Object,
	#category : #'FAST-Java-Tools-slicing'
}

{ #category : #'as yet unclassified' }
FASTJavaSlicer >> sliceDown: aVariable from: aStatement in: aFlowGraph [
	| startingNode |
	startingNode := aFlowGraph findNodeWithStatement: aStatement.
	startingNode ifNil: [ Error signal: 'Statement not found in flow graph' ].

	((startingNode defVariable = aVariable) or: [ startingNode refVariables includes: aVariable ])
	ifFalse: [ Error signal: 'Variable not found in statement' ].

	startingNode startSlice.
	^startingNode sliceDownVariables: { aVariable }
]
