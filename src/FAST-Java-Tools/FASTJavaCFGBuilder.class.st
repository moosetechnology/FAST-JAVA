Class {
	#name : 'FASTJavaCFGBuilder',
	#superclass : 'FASTGenericCFGBuilder',
	#instVars : [
		'ongoingLoopBlocksDict',
		'ongoingLoopBlocksStack'
	],
	#category : 'FAST-Java-Tools',
	#package : 'FAST-Java-Tools'
}

{ #category : 'as yet unclassified' }
FASTJavaCFGBuilder >> closingBreakableStatement: aFASTConditionalLoop [

	self assert: ongoingLoopBlocksStack top = aFASTConditionalLoop.
	ongoingLoopBlocksStack pop.

	"setting up links between blocks ending with break and block following the loop"
	(ongoingLoopBlocksDict at: aFASTConditionalLoop) do: [ :block |
			block statements last class = FASTJavaBreakStatement
				ifTrue: [
						self addPendingNextBlockAction: [ :nextBlock |
							block nextBlock: nextBlock ] ]
				"last statement was a continue statement"
				ifFalse: [ block nextBlock: aFASTConditionalLoop ] ].

	ongoingLoopBlocksDict removeKey: aFASTConditionalLoop
]

{ #category : 'initialization' }
FASTJavaCFGBuilder >> initialize [

	super initialize.

	ongoingLoopBlocksStack := Stack new.
	ongoingLoopBlocksDict := Dictionary new.
]

{ #category : 'accessing' }
FASTJavaCFGBuilder >> lastOngoingLoopBlocksStack [

	^ ongoingLoopBlocksStack top
]

{ #category : 'accessing' }
FASTJavaCFGBuilder >> ongoingLoopBlocksStack [

	^ ongoingLoopBlocksStack
]

{ #category : 'as yet unclassified' }
FASTJavaCFGBuilder >> openingNewBreakableStatement: aFASTJavaLoopStatement [

	ongoingLoopBlocksStack push: aFASTJavaLoopStatement.
	ongoingLoopBlocksDict
		at: aFASTJavaLoopStatement
		put: OrderedCollection new
]

{ #category : 'basicBlocks' }
FASTJavaCFGBuilder >> saveCurrentBlockForBreakableStatement [
	"if currentBlock contains a break or continue statement, save it to be able to link it to the correct block"

	(ongoingLoopBlocksDict at: ongoingLoopBlocksStack top) add:
		currentBlock
]
