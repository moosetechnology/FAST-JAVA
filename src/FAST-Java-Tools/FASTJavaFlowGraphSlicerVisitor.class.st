Class {
	#name : #FASTJavaFlowGraphSlicerVisitor,
	#superclass : #FASTJavaFlowGraphAbstractVisitor,
	#instVars : [
		'slice',
		'sliceVariables'
	],
	#category : #'FAST-Java-Tools-slicing'
}

{ #category : #visiting }
FASTJavaFlowGraphSlicerVisitor >> checkIncludeStatement: aFlowGraphNode [
	"check whether to include this 'statement' (a FlowGraphNode contains a FAST statement) into the slice"

	(sliceVariables includes: aFlowGraphNode defVariable )
	ifTrue: [ sliceVariables remove: aFlowGraphNode defVariable ].

	(aFlowGraphNode refVariables anySatisfy: [ :refVar | sliceVariables includes: refVar ])
	ifTrue: [
		slice add: aFlowGraphNode.
		aFlowGraphNode defVariable ifNotNil: [ :defVar | sliceVariables add: defVar ]
	].

]

{ #category : #accessing }
FASTJavaFlowGraphSlicerVisitor >> sliceVariables [

	^ sliceVariables
]

{ #category : #accessing }
FASTJavaFlowGraphSlicerVisitor >> sliceVariables: anObject [

	sliceVariables := anObject
]

{ #category : #visiting }
FASTJavaFlowGraphSlicerVisitor >> traverse: aFlowGraph [
	slice := OrderedCollection new.
	super traverse: aFlowGraph 
]

{ #category : #visiting }
FASTJavaFlowGraphSlicerVisitor >> visitFlowGraphIfNode: aFlowGraphIfNode [
	self checkIncludeStatement: aFlowGraphIfNode.

	^sliceVariables
		ifEmpty: [ ^ false ]
		ifNotEmpty: [ super visitFlowGraphIfNode: aFlowGraphIfNode ]
]

{ #category : #visiting }
FASTJavaFlowGraphSlicerVisitor >> visitFlowGraphNode: aFlowGraphNode [
	self checkIncludeStatement: aFlowGraphNode.

	^sliceVariables
		ifEmpty: [ ^ false ]
		ifNotEmpty: [ super visitFlowGraphNode: aFlowGraphNode ]
]
