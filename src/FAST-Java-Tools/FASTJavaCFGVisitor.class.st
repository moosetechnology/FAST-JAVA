Class {
	#name : 'FASTJavaCFGVisitor',
	#superclass : 'FASTJavaVisitor',
	#traits : 'FASTTCFGVisitor',
	#classTraits : 'FASTTCFGVisitor classTrait',
	#instVars : [
		'#mustNotCloseNextBlock',
		'#breakStatementVisited',
		'#skipStmtsUntilEndOfStmtBlock',
		'#hasDefaultCase',
		'#insideTryBlock',
		'#catchBlocks'
	],
	#category : 'FAST-Java-Tools',
	#package : 'FAST-Java-Tools'
}

{ #category : 'accessing - method dictionary' }
FASTJavaCFGVisitor class >> addAndClassifySelector: selector withMethod: compiledMethod inProtocol: aProtocol [
	"When a new methods is added, I add it to the localMethodDict and also propagate the changes to my users"
	<reflection: 'Class structural modification - Selector/Method modification'>
	self localMethodDict at: selector put: compiledMethod.

	super addAndClassifySelector: selector withMethod: compiledMethod inProtocol: aProtocol.

	TraitChange addSelector: selector on: self
]

{ #category : 'querying' }
FASTJavaCFGVisitor class >> allTraits [
	<reflection: 'Class structural inspection - Traits'>
	^ self traitComposition allTraits
]

{ #category : 'initialization' }
FASTJavaCFGVisitor class >> doRebuildMethodDictionary [

	| selectors removedSelectors modified |
	"During the creation of the class or after a change in the traitComposition, the whole method dictionary is calculated.
	If I return true, my users should be updated""1. I recreate the local methodDict"
	modified := false.
	self methodDict valuesDo: [ :m | m traitSource ifNil: [ self localMethodDict at: m selector put: m ] ].

	"2. I filter the selectors from the trait composition, rejecting the ones that are locally defined.
	And then I install the methods in myself. The trait composition only install the method if it is needed."
	selectors := self traitComposition selectors reject: [ :e | self localMethodDict includesKey: e ].
	selectors do: [ :e | modified := modified | (self traitComposition installSelector: e into: self replacing: false) ].

	"3. I handle the methods that I have and they are no more in the traitComposition."
	removedSelectors := self methodDict keys reject: [ :aSelector | (selectors includes: aSelector) or: [ self localMethodDict includesKey: aSelector ] ].
	modified := modified | removedSelectors isNotEmpty.
	removedSelectors do: [ :aSelector |
		self methodDict removeKey: aSelector.
		self removeFromProtocols: aSelector ].

	^ modified
]

{ #category : 'testing' }
FASTJavaCFGVisitor class >> findOriginClassOf: aMethod [

	"I return the myself or the trait that has the original implementation of a method.
	If the method is an alias, the returned class includes the original aliased method"
	<reflection: 'Class structural inspection - Selectors and methods inspection'>
	
	(aMethod hasProperty: #traitSource)
		ifTrue: [ ^ aMethod traitSource innerClass ].

	(self includesLocalSelector: aMethod selector)
		ifTrue: [ ^ self ].

	^ (self traitComposition traitDefining: aMethod selector ifNone: [ ^ self ]) innerClass
]

{ #category : 'testing' }
FASTJavaCFGVisitor class >> findOriginMethodOf: aMethod [

	"I return the original method for a aMethod.
	If this is a local method, the original method is itself.
	If it cames from a trait composition I look for the method in the trait composition.
	First I try with the trait stored in the traitSource.
	If it is an aliased or conflicting method, the method is look up in the whole trait composition"
	<reflection: 'Class structural inspection - Selectors and methods inspection'>
	
	(self includesLocalSelector: aMethod selector)
		ifTrue: [ ^ aMethod ].

	(aMethod hasProperty: #traitSource)
		ifTrue: [ |newSelector|
			newSelector := self traitComposition originSelectorOf: aMethod selector.
			^ aMethod traitSource compiledMethodAt: newSelector ifAbsent: [aMethod] ].

	^ (self traitComposition traitDefining: aMethod selector ifNone: [ self ])
		compiledMethodAt: aMethod selector ifAbsent: [ ^ aMethod ]
]

{ #category : 'testing' }
FASTJavaCFGVisitor class >> hasTraitComposition [

	^ self traitComposition isEmpty not
]

{ #category : 'testing' }
FASTJavaCFGVisitor class >> includesLocalSelector: aSymbol [
	<reflection: 'Class structural inspection - Shared pool inspection'>
	^ self isLocalSelector: aSymbol
]

{ #category : 'testing' }
FASTJavaCFGVisitor class >> includesTrait: aTrait [

	<reflection: 'Class structural inspection - Traits'>
	^ self traitComposition includesTrait: aTrait
]

{ #category : 'testing' }
FASTJavaCFGVisitor class >> isAliasSelector: aSymbol [
	"Return true if the selector aSymbol is an alias defined
	in my or in another composition somewhere deeper in
	the tree of traits compositions."

	^ self traitComposition isAliasSelector: aSymbol
]

{ #category : 'testing' }
FASTJavaCFGVisitor class >> isLocalAliasSelector: aSymbol [
	"Return true if the selector aSymbol is an alias defined
	in my trait composition."

	^ self traitComposition isLocalAliasSelector: aSymbol
]

{ #category : 'testing' }
FASTJavaCFGVisitor class >> isLocalSelector: aSelector [
	<reflection: 'Class structural inspection - Selectors and methods inspection'>
	^ self localMethodDict includesKey: aSelector
]

{ #category : 'accessing' }
FASTJavaCFGVisitor class >> localMethodDict [
	"The local methodDict is in the metaclass. In this way I do not have to recompile the methods during the bootstrap when we don't have a compiler."
	^ self class baseLocalMethods
]

{ #category : 'accessing' }
FASTJavaCFGVisitor class >> localMethodDict: aMethodDictionary [
	^ self class baseLocalMethods: aMethodDictionary
]

{ #category : 'accessing' }
FASTJavaCFGVisitor class >> localMethods [
	"returns the methods of classes excluding the ones of the traits that the class uses"
	<reflection: 'Class structural inspection - Selectors and methods inspection'>
	^ self localMethodDict values
]

{ #category : 'accessing - method dictionary' }
FASTJavaCFGVisitor class >> localSelectors [
	<reflection: 'Class structural inspection - Selectors and methods inspection'>
	^ self localMethodDict keys
]

{ #category : 'initialization' }
FASTJavaCFGVisitor class >> rebuildMethodDictionary [

	"Useful to be rewritten in Traits"
	^ self doRebuildMethodDictionary
]

{ #category : 'categories' }
FASTJavaCFGVisitor class >> recategorizeSelector: selector from: oldProtocol to: newProtocol [
	"When a method is recategorized I have to classify the method, but also recategorize the aliases pointing to it"

	| originalProtocol |
	"If it is nil is because it is a removal. It will removed when the method is removed."
	newProtocol ifNil: [ ^ self ].

	originalProtocol := (self protocolOfSelector: selector) ifNil: [ ^ self ].
	originalProtocol name = oldProtocol name ifTrue: [ self classify: selector under: newProtocol name ].

	(self traitComposition reverseAlias: selector) do: [ :selectorAlias |
		self recategorizeSelector: selectorAlias from: oldProtocol to: newProtocol.
		self notifyOfRecategorizedSelector: selectorAlias from: oldProtocol to: newProtocol ]
]

{ #category : 'recompilation' }
FASTJavaCFGVisitor class >> recompile: selector from: oldClass [

	super recompile: selector from: oldClass.
	TraitChange addSelector: selector on: self
]

{ #category : 'trait-composition' }
FASTJavaCFGVisitor class >> removeFromComposition: aTrait [

	self setTraitComposition: (self traitComposition copyWithoutTrait: aTrait asTraitComposition)
]

{ #category : 'removing' }
FASTJavaCFGVisitor class >> removeFromSystem: logged [

	"When a traited class is removed the traits it is using should be updated"
	| mySubclasses |
	self traitComposition removeUser: self.
	self class traitComposition removeUser: self class.

	TraitedClass removeUser: self class.

	mySubclasses := self subclasses.

	super removeFromSystem: logged.

	"As I am a traited class my subclasses does not have the basic traited class
	methods, so I add them."
	mySubclasses do: [ :each | each class initializeBasicMethods ]
]

{ #category : 'removing' }
FASTJavaCFGVisitor class >> removeSelector: aSelector [

	"When a selector is removed it should be notified to my users.
	Check the class TraitChange for more details"
	<reflection: 'Class structural modification - Selector/Method modification'>
	super removeSelector: aSelector.
	self localMethodDict removeKey: aSelector ifAbsent: [  ].

	TraitChange removeSelector: aSelector on: self
]

{ #category : 'accessing' }
FASTJavaCFGVisitor class >> traitComposition [
	"My trait composition is in my class. So I do not need to recompile the methods when installing them during bootstrap"
	^ self class baseComposition
]

{ #category : 'accessing' }
FASTJavaCFGVisitor class >> traitComposition: aComposition [

	aComposition asTraitComposition allTraits do: [ :aMaybeTrait |
		aMaybeTrait isTrait ifFalse: [
			self error: 'All the members of the trait composition should be traits' ]].

	self class baseComposition: aComposition
]

{ #category : 'accessing' }
FASTJavaCFGVisitor class >> traitCompositionString [
	^ self traitComposition asString
]

{ #category : 'accessing' }
FASTJavaCFGVisitor class >> traitUsers [
	"I am a traited class, I have no users, this is for compatibility with traits"
		<reflection: 'Class structural inspection - Traits'>
	^ #()
]

{ #category : 'accessing' }
FASTJavaCFGVisitor class >> traits [
	<reflection: 'Class structural inspection - Traits'>
	^ self traitComposition traits
]

{ #category : 'accessing' }
FASTJavaCFGVisitor >> breakStatementVisited [

	^ breakStatementVisited
]

{ #category : 'accessing' }
FASTJavaCFGVisitor >> cfgBuilder [

	^ cfgBuilder
]

{ #category : 'accessing' }
FASTJavaCFGVisitor >> cfgBuilder: anObject [

	cfgBuilder := anObject
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitor >> conditionForCatch: catch [

	| exporter |
	exporter := catch exporterForCFG.

	^ String streamContents: [ :s |
			  s nextPutAll: 'Catches ('.
			  catch catchedTypes
				  do: [ :type | s nextPutAll: (exporter export: type) ]
				  separatedBy: [ s nextPutAll: ' | ' ].
			  s nextPut: $) ]
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitor >> conditionForCatchedThrow: catch [

	| exporter |
	exporter := catch exporterForCFG.

	^ String streamContents: [ :s |
			  s nextPutAll: 'Catched as ('.
			  catch catchedTypes
				  do: [ :type | s nextPutAll: (exporter export: type) ]
				  separatedBy: [ s nextPutAll: ' | ' ].
			  s nextPut: $) ]
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitor >> createConditionFor: case [

	| exporter |
	exporter := case exporterForCFG.
	case class = FASTJavaDefaultCaseStatement ifTrue: [ ^ 'default' ].

	^ String streamContents: [ :s |
			  s
				  nextPut: $(;
				  nextPutAll:
					  (exporter export: case javaCaseStatementSwitchOwner condition);
				  nextPutAll: ') = ';
				  nextPutAll: (exporter export: case label) ]
]

{ #category : 'initialization' }
FASTJavaCFGVisitor >> initialize [

	super initialize.

	mustNotCloseNextBlock := false.
	breakStatementVisited := false.
	skipStmtsUntilEndOfStmtBlock := false.
	hasDefaultCase := false.
	insideTryBlock := false.
	catchBlocks := OrderedCollection new
	
]

{ #category : 'asserting' }
FASTJavaCFGVisitor >> shouldIfFinalBlockBeClosed: aFASTJavaIfStatement [
"black magic to know if you can close current blocks within an if"
	| parentStatementBlock parentNode isIfLastStmt isImbricatedIf |
	aFASTJavaIfStatement ifElsePartOwner ifNotNil: [ ^ false ].

	parentStatementBlock := aFASTJavaIfStatement parentNode.
	parentNode := parentStatementBlock fastBehaviouralParent.

	isIfLastStmt := parentStatementBlock statements last
	                = aFASTJavaIfStatement.

	isImbricatedIf := parentNode class = FASTJavaIfStatement.

	^ isIfLastStmt
		  ifTrue: [ isImbricatedIf ]
		  ifFalse: [ isImbricatedIf not ]
]

{ #category : 'accessing' }
FASTJavaCFGVisitor >> skipStmtsUntilEndOfStmtBlock [

	^ skipStmtsUntilEndOfStmtBlock
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaBreakStatement: aFASTJavaBreakStatement [

	| newBlock |
	insideTryBlock
		ifTrue: [
				cfgBuilder closeCurrentBlock.
				cfgBuilder currentBlock ifNil: [
						newBlock := cfgBuilder newBasicBlock: FASTBasicBlock.
						newBlock addStatement: aFASTJavaBreakStatement ] ]
		ifFalse: [
		super visitFASTJavaBreakStatement: aFASTJavaBreakStatement ].

	breakStatementVisited := true.
	skipStmtsUntilEndOfStmtBlock := true.

	"it should be alright, no? last one at this point should always be for the block ending with a break"
	insideTryBlock ifFalse: [
		cfgBuilder removeLastPendingNextBlockAction ].

	cfgBuilder saveCurrentBlockForBreakableStatement
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaCaseStatement: aFASTJavaCaseStatement [

	^ self
		  visitFASTJavaCaseStatement: aFASTJavaCaseStatement
		  withSwitchBlock: cfgBuilder lastOngoingLoopBlocksStack
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaCaseStatement: aFASTJavaCaseStatement withSwitchBlock: conditionalBlock [

	| caseBlock |
	cfgBuilder addPendingNextBlockAction: [ :caseBlock |
			conditionalBlock
				nextBlock: caseBlock
				onValue: (self createConditionFor: aFASTJavaCaseStatement) ].

	super visitFASTJavaCaseStatement: aFASTJavaCaseStatement.

	caseBlock := cfgBuilder currentBlock.

	cfgBuilder addPendingNextBlockAction: [ :nextBlock |
		caseBlock nextBlock: nextBlock ].
	
	cfgBuilder closeCurrentBlock 
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaCatchPartStatement: aFASTJavaCatchPartStatement [
	
	self visitFASTTStatementBlock: aFASTJavaCatchPartStatement 
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaClassDeclaration: aFASTJavaClassDeclaration [
	Error signal: 'Cannot create a CFG from a class declaration.'
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaCompilationUnit: aFASTJavaCompilationUnit [

	Error signal: 'Cannot create a CFG from a Java compilation unit.'
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaConditionalExpression: aFASTJavaConditionalExpression [

	self
		visitFASTJavaConditionalExpression: aFASTJavaConditionalExpression
		isNested: false
		withinReturn: false
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaConditionalExpression: aFASTJavaConditionalExpression isNested: isNested [

	| conditionalBlock pendingActions |
	conditionalBlock := cfgBuilder newConditionalBlock:
		                    aFASTJavaConditionalExpression.

	"then-statement"
	self assert: cfgBuilder pendingNextBlock isEmpty.
	cfgBuilder addPendingNextBlockAction: [ :thenBlock |
		conditionalBlock nextBlock: thenBlock onValue: true ].
	cfgBuilder closeCurrentBlock.

	aFASTJavaConditionalExpression thenPart class
	= FASTJavaConditionalExpression
		ifTrue: [
				self
					visitFASTJavaConditionalExpression:
					aFASTJavaConditionalExpression thenPart
					isNested: true ]
		ifFalse: [
				cfgBuilder addStatementFromExpression:
					aFASTJavaConditionalExpression thenPart ].

	isNested ifFalse: [ cfgBuilder closeCurrentBlock ].

	"postponing pending actions created in the then part, in case there is an else part"
	pendingActions := cfgBuilder copyAndRemovePendingActions.

	"adding a new pending action, either for the new else block or following code if no elsePart"
	cfgBuilder addPendingNextBlockAction: [ :elseOrNextBlock |
		conditionalBlock nextBlock: elseOrNextBlock onValue: false ].

	"else part"
	cfgBuilder closeCurrentBlock.
	aFASTJavaConditionalExpression elsePart class
	= FASTJavaConditionalExpression
		ifTrue: [
				self
					visitFASTJavaConditionalExpression:
					aFASTJavaConditionalExpression elsePart
					isNested: true ]
		ifFalse: [
				cfgBuilder addStatementFromExpression:
					aFASTJavaConditionalExpression elsePart ].

	"putting the postponed pending actions back in place"
	cfgBuilder addPendingNextBlockActions: pendingActions.
	cfgBuilder closeCurrentBlock
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaConditionalExpression: aFASTJavaConditionalExpression isNested: isNested withinReturn: withinReturn [

	| expression conditionalBlock pendingActions |
	expression := withinReturn
		              ifTrue: [ aFASTJavaConditionalExpression expression ]
		              ifFalse: [ aFASTJavaConditionalExpression ].

	"using the parameter to include the return statement if the condition is used in a return"
	conditionalBlock := cfgBuilder newConditionalBlock:
		                    aFASTJavaConditionalExpression.

	"then-statement"
	self assert: cfgBuilder pendingNextBlock isEmpty.
	cfgBuilder addPendingNextBlockAction: [ :thenBlock |
		conditionalBlock nextBlock: thenBlock onValue: true ].
	cfgBuilder closeCurrentBlock.

	expression thenPart class
	= FASTJavaConditionalExpression
		ifTrue: [
				self
					visitFASTJavaConditionalExpression:
					expression thenPart
					isNested: true ]
		ifFalse: [
				cfgBuilder addStatementFromExpression:
					expression thenPart ].

	isNested ifFalse: [ cfgBuilder closeCurrentBlock ].

	"postponing pending actions created in the then part, in case there is an else part"
	pendingActions := cfgBuilder copyAndRemovePendingActions.

	"adding a new pending action, either for the new else block or following code if no elsePart"
	cfgBuilder addPendingNextBlockAction: [ :elseOrNextBlock |
		conditionalBlock nextBlock: elseOrNextBlock onValue: false ].

	"else part"
	cfgBuilder closeCurrentBlock.
	expression elsePart class
	= FASTJavaConditionalExpression
		ifTrue: [
				self
					visitFASTJavaConditionalExpression:
					expression elsePart
					isNested: true ]
		ifFalse: [
				cfgBuilder addStatementFromExpression:
					expression elsePart ].

	"putting the postponed pending actions back in place"
	cfgBuilder addPendingNextBlockActions: pendingActions.
	cfgBuilder closeCurrentBlock
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaContinueStatement: aFASTJavaContinueStatement [
	
	skipStmtsUntilEndOfStmtBlock := true.

	"super visitFASTJavaContinueStatement: aFASTJavaContinueStatement."
	cfgBuilder currentBlock ifNil: [ cfgBuilder newBasicBlock: FASTBasicBlock ].
	"todo if no block create block"
	cfgBuilder currentBlock addStatement: aFASTJavaContinueStatement.

	cfgBuilder saveCurrentBlockForBreakableStatement
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaDefaultCaseStatement: aFASTJavaDefaultCaseStatement [

	hasDefaultCase := true.
	^ self visitFASTJavaCaseStatement: aFASTJavaDefaultCaseStatement
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaDoWhileStatement: aFASTJavaDoWhileStatement [
	
	| doBlock conditionalBlock thenBlock |
	"do-statement"
	cfgBuilder closeCurrentBlock.
	aFASTJavaDoWhileStatement body accept: self.
	
	doBlock := cfgBuilder currentBlock.

	conditionalBlock := cfgBuilder newConditionalBlock:
		                    aFASTJavaDoWhileStatement.

	"linking previous block to loop"
	"if a break was encountered, then we don't chain now (it will be chained to the block after the for)"
	breakStatementVisited
		ifTrue: [ breakStatementVisited := false ]
		ifFalse: [ cfgBuilder chainPendingBlocksTo: conditionalBlock ].

	"saving then block to link to conditional block"
	thenBlock := cfgBuilder currentBlock.
	conditionalBlock nextBlock: doBlock onValue: true.

	"linking for end to next block"
	cfgBuilder addPendingNextBlockAction: [ :nextBlock |
		conditionalBlock nextBlock: nextBlock onValue: false ].

	cfgBuilder closeCurrentBlock
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaForEachStatement: aFASTJavaForEachStatement [
	
	self visitFASTJavaLoopStatement: aFASTJavaForEachStatement 
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaForStatement: aFASTJavaForStatement [
	
	self visitFASTJavaLoopStatement: aFASTJavaForStatement 
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [

	| mustBeClosed conditionalBlock thenBlock pendingActions elseBlock |
	mustBeClosed := self shouldIfFinalBlockBeClosed: aFASTJavaIfStatement.
	
	conditionalBlock := cfgBuilder newConditionalBlock:
		                    aFASTJavaIfStatement.

	"then-statement"
	self assert: cfgBuilder pendingNextBlock isEmpty.
	cfgBuilder addPendingNextBlockAction: [ :thenBlock |
		conditionalBlock nextBlock: thenBlock onValue: true ].
	cfgBuilder closeCurrentBlock.

	aFASTJavaIfStatement thenPart accept: self.

	"saving then block to link to block after if/else"
	thenBlock := cfgBuilder currentBlock.

	"postponing pending actions created in the then part, in case there is an else part"
	pendingActions := cfgBuilder copyAndRemovePendingActions.

	"adding a new pending action, either for the new else block or following code if no elsePart"
	cfgBuilder addPendingNextBlockAction: [ :elseOrNextBlock |
		conditionalBlock nextBlock: elseOrNextBlock onValue: false ].

	"else part"
	aFASTJavaIfStatement elsePart ifNotNil: [
			cfgBuilder closeCurrentBlock.
			aFASTJavaIfStatement elsePart accept: self.

			"saving else block to link to block after if/else"
			elseBlock := cfgBuilder currentBlock.

			"linking else block to next block"
			"cfgBuilder addPendingNextBlockAction: [ :nextBlock |
				elseBlock nextBlock: nextBlock ]" ].

	"putting the postponed pending actions back in place"
	cfgBuilder addPendingNextBlockActions: pendingActions.

	"hack to return a current block for else if statements"
	mustBeClosed
		ifTrue: [ cfgBuilder closeCurrentBlockIfPossible ]
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaInterfaceDeclaration: aFASTJavaInterfaceDeclaration [
	
	Error signal: 'Cannot create a CFG from an interface declaration.'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitor >> visitFASTJavaLoopStatement: aFASTJavaWhileStatement [

	| conditionalBlock thenBlock |
	conditionalBlock := cfgBuilder newConditionalBlock:
		                    aFASTJavaWhileStatement.
	cfgBuilder openingNewBreakableStatement: conditionalBlock.
		
	"then-statement"
	self assert: cfgBuilder pendingNextBlock isEmpty.

	cfgBuilder closeCurrentBlock.
	
	cfgBuilder addPendingNextBlockAction: [ :bodyBlock |
		conditionalBlock nextBlock: bodyBlock onValue: true ].
	aFASTJavaWhileStatement body accept: self.

	"linking previous block to loop"
	"if a break was encountered, we can reset to default now"
	breakStatementVisited
		ifTrue: [ breakStatementVisited := false ].
	cfgBuilder chainPendingBlocksTo: conditionalBlock.

	"saving then block to link to conditional block"
	thenBlock := cfgBuilder currentBlock.
	"conditionalBlock nextBlock: thenBlock onValue: true."

	"linking for end to next block"
	cfgBuilder addPendingNextBlockAction: [ :nextBlock |
		conditionalBlock nextBlock: nextBlock onValue: false ].

	cfgBuilder closeCurrentBlock.
	cfgBuilder closingBreakableStatement: conditionalBlock
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [

	| visit |
	visit := super visitFASTJavaMethodEntity: aFASTJavaMethodEntity.

	cfgBuilder basicBlocks first isStart: true.

	"case where method has no return instruction (void signature)"
	cfgBuilder currentBlock ifNotNil: [
		cfgBuilder chainPendingBlocksTo: FASTNullBlock new ].

	^ visit
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaSwitchStatement: aFASTJavaSwitchStatement [

	| conditionalBlock |
	conditionalBlock := cfgBuilder newConditionalBlock:
		                    aFASTJavaSwitchStatement.
	cfgBuilder openingNewBreakableStatement: conditionalBlock.

	"then-statement"
	self assert: cfgBuilder pendingNextBlock isEmpty.

	cfgBuilder closeCurrentBlock.

	aFASTJavaSwitchStatement cases do: [ :case |
			case accept: self ].

	hasDefaultCase
		ifTrue: [ hasDefaultCase := false ]
		ifFalse: [
				cfgBuilder addPendingNextBlockAction: [ :nextBlock |
					conditionalBlock nextBlock: nextBlock onValue: '[None]' ] ].
			
	cfgBuilder closingBreakableStatement: conditionalBlock 
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaThrowStatement: aFASTJavaThrowStatement [

	insideTryBlock
		"needs to be handled, and I know it's going to be painful"
		ifTrue: [ self visitFASTJavaThrowStatementWithinTryBlock: aFASTJavaThrowStatement ]
		"if it stops the method's execution, treat it as you would treat a return"
		ifFalse: [ self visitFASTTReturnStatement: aFASTJavaThrowStatement ]
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaThrowStatementWithinTryBlock: aFASTJavaThrowStatement [
"currently does not try to solve anything to actually add precise edges, would be cool if it did"
	| newBlock finalBlock |
	cfgBuilder closeCurrentBlock.

	newBlock := cfgBuilder newBasicBlock: FASTConditionalBasicBlock.
	skipStmtsUntilEndOfStmtBlock ifFalse: [
		cfgBuilder currentBlock addStatement: aFASTJavaThrowStatement ].

	catchBlocks keysAndValuesDo: [ :catch :catchBlock |
			newBlock
				nextBlock: catchBlock
				onValue: (self conditionForCatchedThrow: catch) ].

	finalBlock := cfgBuilder newBasicBlock: FASTBasicBlock.
	finalBlock nextBlock: FASTNullBlock new.
	newBlock nextBlock: finalBlock onValue: '[Uncatched exception]'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitor >> visitFASTJavaTryCatchStatement: aFASTJavaTryCatchStatement [

	self visitFASTJavaTryCatchStatementPrecise: aFASTJavaTryCatchStatement 
	"self visitFASTJavaTryCatchStatementApproximative: aFASTJavaTryCatchStatement"
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitor >> visitFASTJavaTryCatchStatementApproximative: aFASTJavaTryCatchStatement [

	| tryBlock |
	tryBlock := cfgBuilder newBasicBlock: FASTTryBasicBlock.

	self assert: cfgBuilder pendingNextBlock isEmpty.
	aFASTJavaTryCatchStatement try accept: self.
	cfgBuilder closeCurrentBlock.

	aFASTJavaTryCatchStatement catches do: [ :catch |
			cfgBuilder addPendingNextBlockAction: [ :catchBlock |
				tryBlock
					nextBlock: catchBlock
					onValue: (self conditionForCatch: catch) ].
			catch accept: self.
			catchBlocks add: cfgBuilder currentBlock.
			cfgBuilder closeCurrentBlock ].

	cfgBuilder addPendingNextBlockAction: [ :nextBlock |
		tryBlock nextBlock: nextBlock onValue: '[No exceptions]' ].

	catchBlocks do: [ :cb |
			cfgBuilder addPendingNextBlockAction: [ :nextBlock |
				cb nextBlock: nextBlock ] ].
	catchBlocks removeAll
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitor >> visitFASTJavaTryCatchStatementPrecise: aFASTJavaTryCatchStatement [

	| nextBlockActions |
	"ugly, i need to find a better way to do this"
	nextBlockActions := cfgBuilder copyAndRemovePendingActions.

	cfgBuilder closeCurrentBlock.

	catchBlocks := Dictionary new.
	aFASTJavaTryCatchStatement catches do: [ :catch |
			catch accept: self.
			catchBlocks at: catch put: cfgBuilder currentBlock.
			cfgBuilder removePendingActionFor: cfgBuilder currentBlock.
			cfgBuilder closeCurrentBlock ].

	nextBlockActions do: [ :act |
		cfgBuilder addPendingNextBlockAction: act ].

	"have to do it here to treat the catch blocks correctly"
	insideTryBlock := true.

	aFASTJavaTryCatchStatement try accept: self.

	catchBlocks do: [ :cb |
			cfgBuilder addPendingNextBlockAction: [ :nextBlock |
				cb nextBlock: nextBlock ] ].

	catchBlocks removeAll.
	insideTryBlock := false.

	aFASTJavaTryCatchStatement finally ifNotNil: [
		cfgBuilder closeCurrentBlock.
		self visitFASTTStatementBlock: aFASTJavaTryCatchStatement finally ]
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTJavaWhileStatement: aFASTJavaWhileStatement [

	self visitFASTJavaLoopStatement: aFASTJavaWhileStatement
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTTReturnStatement: aFASTReturnStatement [
	
	"yet another solution that I am not a huge fan of, but for now it'll do"
	aFASTReturnStatement expression class = FASTJavaConditionalExpression
		ifTrue: [
				^ self
					visitFASTJavaConditionalExpression: aFASTReturnStatement
					isNested: false
					withinReturn: true ].

	insideTryBlock
		ifFalse: [
				self visitFASTTStatement: aFASTReturnStatement.
				cfgBuilder currentBlock nextBlock: FASTNullBlock new
				"cfgBuilder closeCurrentBlock" ]
		ifTrue: [
				self visitFASTTStatementWithinTryBlock: aFASTReturnStatement.
				"removing the '[No exceptions]' pending edge and set it manually"
				cfgBuilder removeLastPendingNextBlockAction.
				cfgBuilder currentBlock
					nextBlock: FASTNullBlock new
					onValue: '[No exceptions]' ]
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTTStatement: aFASTStatement [

	| newBlock |
	insideTryBlock ifTrue: [
		^ self visitFASTTStatementWithinTryBlock: aFASTStatement ].

	(cfgBuilder currentBlock isNil or: [
		 cfgBuilder currentBlock class = FASTConditionalBasicBlock ])
		ifTrue: [
				newBlock := cfgBuilder newBasicBlock: FASTBasicBlock.
				cfgBuilder addPendingNextBlockAction: [ :nextBlock |
					newBlock nextBlock: nextBlock ] ].

	skipStmtsUntilEndOfStmtBlock ifFalse: [
			| currentBlock |
			currentBlock := cfgBuilder currentBlock.
			
			super visitFASTTStatement: aFASTStatement.
			
			"only adding statement if no expression made changes to the CFG"
			currentBlock = cfgBuilder currentBlock ifTrue: [
				cfgBuilder currentBlock addStatement: aFASTStatement ] ]
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTTStatementBlock: aFASTStatementBlock [

	| blockCount |
	"visiting statements directly to avoid sending the statement block to `visitFASTTStatement:`"
	blockCount := cfgBuilder basicBlocks size.

	aFASTStatementBlock containedEntities do: [ :child |
		child accept: self ].

	"adds an empty block for an empty statement block, mostly here to avoid bugs"
	"could be done better? time will tell"
	blockCount = cfgBuilder basicBlocks size ifTrue: [
		cfgBuilder newBasicBlock: FASTBasicBlock ].

	"setting it back to default state in case a continue or break stmt was visited"
	skipStmtsUntilEndOfStmtBlock := false
]

{ #category : 'generated' }
FASTJavaCFGVisitor >> visitFASTTStatementWithinTryBlock: aFASTStatement [

	| newBlock |
	cfgBuilder closeCurrentBlock.

	newBlock := cfgBuilder newBasicBlock: FASTConditionalBasicBlock.

	catchBlocks keysAndValuesDo: [ :catch :catchBlock |
			newBlock
				nextBlock: catchBlock
				onValue: (self conditionForCatch: catch) ].

	cfgBuilder addPendingNextBlockAction: [ :nextBlock |
		newBlock nextBlock: nextBlock onValue: '[No exceptions]' ].

	skipStmtsUntilEndOfStmtBlock ifFalse: [
		cfgBuilder currentBlock addStatement: aFASTStatement ]
]
