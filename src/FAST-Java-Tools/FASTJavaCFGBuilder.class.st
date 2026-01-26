Class {
	#name : 'FASTJavaCFGBuilder',
	#superclass : 'FASTGenericCFGBuilder',
	#instVars : [
		'ongoingLoopBlocksDict',
		'ongoingLoopBlocksStack',
		'conditionalStack'
	],
	#category : 'FAST-Java-Tools',
	#package : 'FAST-Java-Tools'
}

{ #category : 'adding' }
FASTJavaCFGBuilder >> addPendingNextBlockActions: aList [

	pendingNextBlock addAll: aList
]

{ #category : 'adding' }
FASTJavaCFGBuilder >> addStatementFromExpression: aFASTJavaExpression [

	currentBlock ifNil: [
			| newBlock |
			newBlock := self newBasicBlock: FASTBasicBlock.
			self addPendingNextBlockAction: [ :nextBlock |
				newBlock nextBlock: nextBlock ] ].
		
	currentBlock addStatement:
		(FASTJavaExpressionStatement new expression: aFASTJavaExpression)
]

{ #category : 'as yet unclassified' }
FASTJavaCFGBuilder >> closeCurrentBlockIfPossible [
"this is used to avoid closing blocks that are susceptible to be used by a parent statement (ex: if imbricated in ifs)"
	conditionalStack ifEmpty: [ self closeCurrentBlock ]
]

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

{ #category : 'accessing' }
FASTJavaCFGBuilder >> conditionalStack [

	^ conditionalStack
]

{ #category : 'copying' }
FASTJavaCFGBuilder >> copyAndRemovePendingActions [
	"not sure that it is the best way to implement a way to postpone pending actions, but it'll do for now"

	| copy |
	copy := pendingNextBlock copy.
	pendingNextBlock removeAll.
	^ copy
]

{ #category : 'initialization' }
FASTJavaCFGBuilder >> initialize [

	super initialize.

	self cfgVisitor: FASTJavaCFGVisitor new.
	ongoingLoopBlocksStack := Stack new.
	ongoingLoopBlocksDict := Dictionary new.
	conditionalStack := Stack new
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

{ #category : 'adding' }
FASTJavaCFGBuilder >> popConditionalFromStack [

	conditionalStack pop
]

{ #category : 'adding' }
FASTJavaCFGBuilder >> popConditionalFromStack: aConditionalBlock [

	self assert: conditionalStack top = aConditionalBlock.
	conditionalStack pop.
]

{ #category : 'adding' }
FASTJavaCFGBuilder >> pushConditionalToStack: conditionalBlock [

	conditionalStack push: conditionalBlock 
]

{ #category : 'basicBlocks' }
FASTJavaCFGBuilder >> saveCurrentBlockForBreakableStatement [
	"if currentBlock contains a break or continue statement, save it to be able to link it to the correct block"

	(ongoingLoopBlocksDict at: ongoingLoopBlocksStack top) add:
		currentBlock
]
