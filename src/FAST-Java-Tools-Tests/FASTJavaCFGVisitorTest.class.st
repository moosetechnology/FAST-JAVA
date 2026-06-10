"
A FASTJavaCFGVisitorTest is a test class for testing the behavior of FASTJavaCFGVisitor
"
Class {
	#name : 'FASTJavaCFGVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'cfgBuilder'
	],
	#category : 'FAST-Java-Tools-Tests',
	#package : 'FAST-Java-Tools-Tests'
}

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> breakInIfMethodSource [

	^ 
'public boolean forMethod() {
	System.out.println("Hello World!");
	for (int i = 0; i < 5; i++) {
  		System.out.println(i);
		if (i == 3) { 
			break;
			System.out.println("Unreachable code.");
		}
		System.out.println("Reachable code.");
	}
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> breakMethodSource [

	^ 
'public boolean forMethod() {
	System.out.println("Hello World!");
	for (int i = 0; i < 5; i++) {
  		System.out.println(i);
		break;
		System.out.println("Unreachable code.");
	}
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> continueInIfMethodSource [

	^ 
'public boolean forMethod() {
	System.out.println("Hello World!");
	for (int i = 0; i < 5; i++) {
  		System.out.println(i);
		if (i == 3) { 
			continue;
			System.out.println("Unreachable code.");
		}
		System.out.println("Reachable code.");
	}
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> continueMethodSource [

	^ 
'public boolean forMethod() {
	System.out.println("Hello World!");
	for (int i = 0; i < 5; i++) {
  		System.out.println(i);
		continue;
		System.out.println("Unreachable code.");
	}
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> doWhileMethodSource [

	^ 
'public boolean doWhileMethod() {
	System.out.println("Hello World!");
	int i = 0;
	do {
		System.out.println(i);
		i++;
	}
	while (i < 5);
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> forEachMethodSource [

	^ 
'public boolean forEachMethod(ArrayList<Integer> list) {
	System.out.println("Hello World!");
	for (Integer i : list) {
  		System.out.println(i);
	}
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> forMethodSource [

	^ 
'public boolean forMethod() {
	System.out.println("Hello World!");
	for (int i = 0; i < 5; i++) {
  		System.out.println(i);
	}
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> getFASTMethodEntityForSource: sourceCode [

	^ (JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString:
		  sourceCode) allFASTJavaMethodEntity first
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> ifElseIfMethodSource [

	^ 
'public int ifElseMethod() {
	int i = 0;
	i = i + 4;
	if (i == 4) {
		System.out.println(i);
	} else if (i == 5) { 
		String str = "This code is very dumb.";
		System.err.println(str);
	} else {  
		String str = "This code is still very dumb.";
		System.err.println(str);
	}
	return i;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> ifElseMethodSource [

	^ 
'public int ifElseMethod() {
	int i = 0;
	i = i + 4;
	if (i == 4) {
		System.out.println(i);
	} else { 
		String str = "This code is very dumb.";
		System.err.println(str);
	}
	return i;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> ifMethodSource [

	^ 
'public int ifElseMethod() {
	int i = 0;
	i = i + 4;
	if (i == 4) {
		System.out.println(i);
	} 
	return i;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> ifWithSingleStatementMethodSource [

	^ 
'public int ifElseMethod() {
	int i = 0;
	i = i + 4;
	if (i == 4)
		System.out.println(i);
	return i;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> imbricatedIfsMethodSource [

	^ 
'public int ifElseMethod() {
	int i = 0;
	i = i + 4;
	if (i > 4) {
		if (i == 5) { 
			System.out.println("This code is very dumb.");
		}
		else { 
			System.out.println(i);
		}
	}
	else {  
		System.out.println("This code is also very dumb.");
	}
	return i;
}'
]

{ #category : 'nil' }
FASTJavaCFGVisitorTest >> noReturnMethodSource [

	^ 
'public void simpleMethod() {
	int i = 0;
	i = i + 4;
	System.out.println(i);
}'
]

{ #category : 'running' }
FASTJavaCFGVisitorTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	cfgBuilder := FASTJavaCFGBuilder new.
	cfgBuilder cfgVisitor: FASTJavaCFGVisitor new
]

{ #category : 'nil' }
FASTJavaCFGVisitorTest >> simpleMethodSource [

	^ 
'public int simpleMethod() {
	int i = 0;
	i = i + 4;
	System.out.println(i);
	return i;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> startWithIfSource [

	^ 
'public void transform(Object input) {
        if (input == null) {
        }
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> swapPositionSource [

	^ 
'private void swapPosition() {
        if (true) {
				System.out.println("whatever1");
            if (true) {
                System.out.println("whatever2");
            } else {
                System.out.println("whatever3");
            }
				System.out.println("whatever4");
        } else {
           	System.out.println("whatever5");
            if (true) {
                if (true) {
                    System.out.println("whatever6");
                } else {
                    System.out.println("whatever7");
                }
            }
			System.out.println("whatever8");
        }
		return;
    }'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> switchMethodSource [

	^ 
'public boolean switchMethod() {
	System.out.println("Hello World!");
	int i = 0;
	switch (i) {
		case 1:
			System.out.println("a");
		case 2:
			System.out.println("b");
		case 3:
			System.out.println("c");
	}
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> switchWithDefaultAndBreaksMethodSource [

	^ 
'public boolean switchWithDefaultAndBreaksMethod() {
	System.out.println("Hello World!");
	int i = 0;
	switch (i) {
		case 1:
			System.out.println("a");
			break;
		case 2:
			System.out.println("b");
		case 3:
			System.out.println("c");
			break;
		default:
			System.out.println("Default code");
	}
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> switchWithDefaultMethodSource [

	^ 
'public boolean switchWithDefaultMethod() {
	System.out.println("Hello World!");
	int i = 0;
	switch (i) {
		case 1:
			System.out.println("a");
		case 2:
			System.out.println("b");
		case 3:
			System.out.println("c");
		default:
			System.out.println("Default code");
	}
	return true;
}'
]

{ #category : 'nil' }
FASTJavaCFGVisitorTest >> ternaryOperatorMethodInReturnSource [

	^ 'public int ternaryOperatorMethodInReturn() {
	int i = 0;
	int j = 4;
	return i > j ? i : j;
}'
]

{ #category : 'nil' }
FASTJavaCFGVisitorTest >> ternaryOperatorMethodNestedSource [

	^ 'public void ternaryOperatorMethod() {
	int i = 0;
	int j = 4;
	int h = i > j ? (i > 6 ? 3 : (j < 2 ? 9 : 6)) : j;
	return h;
}'
]

{ #category : 'nil' }
FASTJavaCFGVisitorTest >> ternaryOperatorMethodSource [

	^ 'public void ternaryOperatorMethod() {
	int i = 0;
	int j = 4;
	int h = i > j ? i : j;
	return h;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testBreakInIfMethodCorrectCFG [

	| startBlock conditionalBlock thenBlock ifBlock ifThenBlock nextBlock finalBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self breakInIfMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 1.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	thenBlock := conditionalBlock nextBlockForValue: true.
	finalBlock := conditionalBlock nextBlockForValue: false.

	self assert: thenBlock isConditional not.
	self assert: thenBlock isFinal not.
	self assert: thenBlock statements size equals: 1.
	
	ifBlock := thenBlock nextBlock.
	
	self assert: ifBlock isConditional.
	self assert: ifBlock isFinal not.
	self assert: ifBlock statements size equals: 1.
	self assert: ifBlock nextBlocks size equals: 2.
	
	ifThenBlock := ifBlock nextBlockForValue: true.
	nextBlock := ifBlock nextBlockForValue: false.
	
	self assert: ifThenBlock isConditional not.
	self assert: ifThenBlock isFinal not.
	self assert: ifThenBlock statements size equals: 1.
	self assert: ifThenBlock statements first class equals: FASTJavaBreakStatement.
	
	self assert: ifThenBlock nextBlock equals: finalBlock.
	
	self assert: nextBlock isConditional not.
	self assert: nextBlock isFinal not.
	self assert: nextBlock statements size equals: 1.
	
	self assert: nextBlock nextBlock equals: conditionalBlock.
	
	self assert: finalBlock isConditional not.
	self assert: finalBlock isFinal.
	self assert: finalBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testBreakMethodCorrectCFG [
	| startBlock conditionalBlock thenBlock nextBlock |
	
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self breakMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 1.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	thenBlock := conditionalBlock nextBlockForValue: true.
	nextBlock := conditionalBlock nextBlockForValue: false.

	self assert: thenBlock isConditional not.
	self assert: thenBlock isFinal not.
	self assert: thenBlock statements size equals: 2.
	self assert: thenBlock statements last class equals: FASTJavaBreakStatement.

	self assert: thenBlock nextBlock equals: nextBlock.
	
	self assert: nextBlock isFinal.
	self assert: nextBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testContinueInIfMethodCorrectCFG [

	| startBlock conditionalBlock thenBlock ifBlock nextBlock finalBlock ifThenBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self continueInIfMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 1.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	thenBlock := conditionalBlock nextBlockForValue: true.
	finalBlock := conditionalBlock nextBlockForValue: false.

	self assert: thenBlock isConditional not.
	self assert: thenBlock isFinal not.
	self assert: thenBlock statements size equals: 1.
	
	ifBlock := thenBlock nextBlock.
	
	self assert: ifBlock isConditional.
	self assert: ifBlock isFinal not.
	self assert: ifBlock statements size equals: 1.
	self assert: ifBlock nextBlocks size equals: 2.
	
	ifThenBlock := ifBlock nextBlockForValue: true.
	nextBlock := ifBlock nextBlockForValue: false.
	
	self assert: ifThenBlock isConditional not.
	self assert: ifThenBlock isFinal not.
	self assert: ifThenBlock statements size equals: 1.
	self assert: ifThenBlock statements first class equals: FASTJavaContinueStatement.
	
	self assert: ifThenBlock nextBlock equals: conditionalBlock.
	
	self assert: nextBlock isConditional not.
	self assert: nextBlock isFinal not.
	self assert: nextBlock statements size equals: 1.
	
	self assert: nextBlock nextBlock equals: conditionalBlock.
	
	self assert: finalBlock isConditional not.
	self assert: finalBlock isFinal.
	self assert: finalBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testContinueMethodCorrectCFG [

	| startBlock conditionalBlock thenBlock nextBlock |
	
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self continueMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 1.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	thenBlock := conditionalBlock nextBlockForValue: true.
	nextBlock := conditionalBlock nextBlockForValue: false.

	self assert: thenBlock isConditional not.
	self assert: thenBlock isFinal not.
	self assert: thenBlock statements size equals: 2.
	self assert: thenBlock statements last class equals: FASTJavaContinueStatement.

	self assert: thenBlock nextBlock equals: conditionalBlock.
	
	self assert: nextBlock isFinal.
	self assert: nextBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testDoWhileMethodCorrectCFG [

	| startBlock conditionalBlock nextBlock doBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self doWhileMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	self assert: startBlock nextBlock isConditional not.

	doBlock := startBlock nextBlock.

	self assert: doBlock isConditional not.
	self assert: doBlock isFinal not.
	self assert: doBlock statements size equals: 2.
	
	conditionalBlock := doBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	self assert: (conditionalBlock nextBlockForValue: true) equals: doBlock.
	nextBlock := conditionalBlock nextBlockForValue: false.
	
	self assert: nextBlock isFinal.
	self assert: nextBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testForEachMethodCorrectCFG [

	| startBlock conditionalBlock thenBlock nextBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self forEachMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 1.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	thenBlock := conditionalBlock nextBlockForValue: true.
	nextBlock := conditionalBlock nextBlockForValue: false.

	self assert: thenBlock isConditional not.
	self assert: thenBlock isFinal not.
	self assert: thenBlock statements size equals: 1.

	self assert: thenBlock nextBlock equals: conditionalBlock.
	
	self assert: nextBlock isFinal.
	self assert: nextBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testForMethodCorrectCFG [

	| startBlock conditionalBlock thenBlock nextBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self forMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 1.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	thenBlock := conditionalBlock nextBlockForValue: true.
	nextBlock := conditionalBlock nextBlockForValue: false.

	self assert: thenBlock isConditional not.
	self assert: thenBlock isFinal not.
	self assert: thenBlock statements size equals: 1.

	self assert: thenBlock nextBlock equals: conditionalBlock.
	
	self assert: nextBlock isFinal.
	self assert: nextBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testIfElseIfMethodCorrectCFG [

	| startBlock conditionalBlock thenBlock elseBlock elseIfTrueBlock elseIfFalseBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self ifElseIfMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	thenBlock := conditionalBlock nextBlockForValue: true.
	elseBlock := conditionalBlock nextBlockForValue: false.
	
	self assert: thenBlock isConditional not.
	self assert: thenBlock isFinal not.
	self assert: thenBlock statements size equals: 1.
	
	self assert: elseBlock isConditional.
	self assert: elseBlock isFinal not.
	self assert: elseBlock statements size equals: 1.
	self assert: elseBlock nextBlocks size equals: 2.
	
	elseIfTrueBlock := elseBlock nextBlockForValue: true.
	elseIfFalseBlock := elseBlock nextBlockForValue: false.
	
	self assert: elseIfTrueBlock isConditional not.
	self assert: elseIfTrueBlock isFinal not.
	self assert: elseIfTrueBlock statements size equals: 2.
	
	self assert: elseIfFalseBlock isConditional not.
	self assert: elseIfFalseBlock isFinal not.
	self assert: elseIfFalseBlock statements size equals: 2.

	self assert: elseIfTrueBlock nextBlock equals: elseIfFalseBlock nextBlock.
	self assert: elseIfTrueBlock nextBlock isFinal.
	self assert: elseIfTrueBlock nextBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testIfElseMethodCorrectCFG [

	| startBlock conditionalBlock thenBlock elseBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self ifElseMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	thenBlock := conditionalBlock nextBlockForValue: true.
	elseBlock := conditionalBlock nextBlockForValue: false.

	self assert: thenBlock isConditional not.
	self assert: thenBlock isFinal not.
	self assert: thenBlock statements size equals: 1.

	self assert: elseBlock isConditional not.
	self assert: elseBlock isFinal not.
	self assert: elseBlock statements size equals: 2.

	self assert: thenBlock nextBlock equals: elseBlock nextBlock.
	self assert: thenBlock nextBlock isFinal.
	self assert: thenBlock nextBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testIfMethodCorrectCFG [

	| startBlock conditionalBlock thenBlock nextBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self ifMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	thenBlock := conditionalBlock nextBlockForValue: true.
	nextBlock := conditionalBlock nextBlockForValue: false.

	self assert: thenBlock isConditional not.
	self assert: thenBlock isFinal not.
	self assert: thenBlock statements size equals: 1.

	self assert: thenBlock nextBlock equals: nextBlock.
	self assert: nextBlock isFinal.
	self assert: nextBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testIfWithSingleStatementMethodCorrectCFG [

	| startBlock conditionalBlock thenBlock nextBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self ifWithSingleStatementMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	thenBlock := conditionalBlock nextBlockForValue: true.
	nextBlock := conditionalBlock nextBlockForValue: false.

	self assert: thenBlock isConditional not.
	self assert: thenBlock isFinal not.
	self assert: thenBlock statements size equals: 1.

	self assert: thenBlock nextBlock equals: nextBlock.
	self assert: nextBlock isFinal.
	self assert: nextBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testImbicatedIfsMethodCorrectCFG [
"bug status : postponing pending actions in else is good and well, but with the imbricated if else it becomes important to know when to execute those pending actions, to ensure that those are not postponed again..."
	| startBlock conditionalBlock elseBlock imbricatedIfBlock imbricatedThenBlock imbricatedElseBlock finalBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self imbricatedIfsMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	imbricatedIfBlock := conditionalBlock nextBlockForValue: true.
	elseBlock := conditionalBlock nextBlockForValue: false.
	finalBlock := elseBlock nextBlock.
	
	self assert: imbricatedIfBlock isConditional.
	self assert: imbricatedIfBlock isFinal not.
	self assert: imbricatedIfBlock statements size equals: 1.
	
	imbricatedThenBlock := imbricatedIfBlock nextBlockForValue: true.
	imbricatedElseBlock := imbricatedIfBlock nextBlockForValue: false.
	
	self assert: imbricatedThenBlock isConditional not.
	self assert: imbricatedThenBlock isFinal not.
	self assert: imbricatedThenBlock statements size equals: 1.
	self assert: imbricatedThenBlock nextBlock equals: finalBlock.
	
	self assert: imbricatedElseBlock isConditional not.
	self assert: imbricatedElseBlock isFinal not.
	self assert: imbricatedElseBlock statements size equals: 1.
	self assert: imbricatedElseBlock nextBlock equals: finalBlock.
	
	self assert: elseBlock isConditional not.
	self assert: elseBlock isFinal not.
	self assert: elseBlock statements size equals: 1.

	self assert: finalBlock isConditional not.
	self assert: finalBlock isFinal.
	self assert: finalBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testNoReturnMethodCorrectCFG [

	| startBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self noReturnMethodSource).
			
	self assert: startBlock isStart.
	self assert: startBlock nextBlock isNullBlock.
	self assert: startBlock statements size equals: 3
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testSimpleMethodCorrectCFG [

	| startBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self simpleMethodSource).
			
	self assert: startBlock isStart.
	self assert: startBlock nextBlock isNullBlock.
	self assert: startBlock statements size equals: 4
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testStartWithIfCorrectCFG [

	| startBlock nextBlock |
	"TODO: it could be an useful test for eventual CFG pruning, but as it is it's just here to make sure this code doesn't make the tool go boom"
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self startWithIfSource).

	self assert: startBlock isConditional.
	self assert: startBlock isFinal.
	self assert: startBlock statements size equals: 1.
	self assert: startBlock nextBlocks size equals: 2.

	nextBlock := startBlock nextBlockForValue: true.
	self assert: nextBlock isConditional not.
	self assert: nextBlock isFinal.
	self assert: nextBlock statements isEmpty
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testSwapPositionCorrectCFG [

	| startBlock ifBlock elseBlock nextBlock ifThenBlock ifElseBlock elseIfBlock elseElseBlock finalBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self swapPositionSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 1.
	self assert: startBlock isConditional.

	"test of first conditional depth"
	ifBlock := startBlock nextBlockForValue: true.
	elseBlock := startBlock nextBlockForValue: false.

	self assert: ifBlock isConditional not.
	self assert: ifBlock statements size equals: 1.

	self assert: elseBlock isConditional not.
	self assert: elseBlock statements size equals: 1.

	"test of second conditional depth"
	ifBlock := ifBlock nextBlock.
	elseBlock := elseBlock nextBlock.

	self assert: ifBlock isConditional.
	self assert: ifBlock statements size equals: 1.
	self assert: ifBlock nextBlocks size equals: 2.

	self assert: elseBlock isConditional.
	self assert: elseBlock statements size equals: 1.
	self assert: elseBlock nextBlocks size equals: 2.
	
	ifThenBlock := ifBlock nextBlockForValue: true.
	ifElseBlock := ifBlock nextBlockForValue: false.
	
	elseIfBlock := elseBlock nextBlockForValue: true.
	elseElseBlock := elseBlock nextBlockForValue: false.
	
	"testing all of the 'true' side of the tree"
	self assert: ifThenBlock isFinal not.
	self assert: ifThenBlock isConditional not.
	self assert: ifThenBlock statements size equals: 1.
	
	self assert: ifElseBlock isFinal not.
	self assert: ifElseBlock isConditional not.
	self assert: ifElseBlock statements size equals: 1.
	
	nextBlock := ifThenBlock nextBlock.
	
	self assert: nextBlock equals: ifElseBlock nextBlock.
	self assert: nextBlock isFinal not.
	self assert: nextBlock isConditional not.
	self assert: nextBlock statements size equals: 1.
	
	finalBlock := nextBlock nextBlock.
	
	"testing all of the 'false' side of the tree"
	self assert: elseIfBlock isFinal not.
	self assert: elseIfBlock isConditional.
	self assert: elseIfBlock statements size equals: 1.
	
	ifThenBlock := elseIfBlock nextBlockForValue: true.
	ifElseBlock := elseIfBlock nextBlockForValue: false.
	
	self assert: ifThenBlock isFinal not.
	self assert: ifThenBlock isConditional not.
	self assert: ifThenBlock statements size equals: 1.
	
	self assert: ifElseBlock isFinal not.
	self assert: ifElseBlock isConditional not.
	self assert: ifElseBlock statements size equals: 1.
	
	self assert: ifThenBlock nextBlock equals: elseElseBlock.
	self assert: ifElseBlock nextBlock equals: elseElseBlock.
	
	self assert: elseElseBlock isFinal not.
	self assert: elseElseBlock isConditional not.
	self assert: elseElseBlock statements size equals: 1.
	self assert: elseElseBlock nextBlock equals: finalBlock.
	
	self assert: finalBlock isFinal.
	self assert: finalBlock isConditional not.
	self assert: finalBlock statements size equals: 1
	

]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testSwitchMethodCorrectCFG [

	| startBlock switchBlock caseOne caseTwo caseThree finalBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self switchMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	self assert: startBlock nextBlock isConditional.

	switchBlock := startBlock nextBlock.

	self assert: switchBlock isStart not.
	self assert: switchBlock isConditional.
	self assert: switchBlock statements size equals: 1.
	self assert: switchBlock nextBlocks size equals: 4.

	caseOne := switchBlock nextBlockForValue: '(i) = 1'.
	caseTwo := switchBlock nextBlockForValue: '(i) = 2'.
	caseThree := switchBlock nextBlockForValue: '(i) = 3'.

	self assert: caseOne isConditional not.
	self assert: caseOne isFinal not.
	self assert: caseOne statements size equals: 1.

	self assert: caseOne nextBlock equals: caseTwo.
	
	self assert: caseTwo isFinal not.
	self assert: caseTwo isConditional not.
	self assert: caseTwo statements size equals: 1.
	
	self assert: caseTwo nextBlock equals: caseThree.
	
	self assert: caseThree isFinal not.
	self assert: caseThree isConditional not.
	self assert: caseThree statements size equals: 1.
	
	finalBlock := caseThree nextBlock.
	
	self assert: (switchBlock nextBlockForValue: '[None]') equals: finalBlock.
	
	self assert: finalBlock isFinal.
	self assert: finalBlock isConditional not.
	self assert: finalBlock statements size equals: 1.
	
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testSwitchWithDefaultAndBreaksMethodCorrectCFG [

	| startBlock switchBlock caseOne caseTwo caseThree finalBlock defaultCase |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self switchWithDefaultAndBreaksMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	self assert: startBlock nextBlock isConditional.

	switchBlock := startBlock nextBlock.

	self assert: switchBlock isStart not.
	self assert: switchBlock isConditional.
	self assert: switchBlock statements size equals: 1.
	self assert: switchBlock nextBlocks size equals: 4.

	caseOne := switchBlock nextBlockForValue: '(i) = 1'.
	caseTwo := switchBlock nextBlockForValue: '(i) = 2'.
	caseThree := switchBlock nextBlockForValue: '(i) = 3'.
	defaultCase := switchBlock nextBlockForValue: 'default'.
	finalBlock := defaultCase nextBlock.

	self assert: caseOne isConditional not.
	self assert: caseOne isFinal not.
	self assert: caseOne statements size equals: 2.

	self assert: caseOne nextBlock equals: finalBlock.

	self assert: caseTwo isFinal not.
	self assert: caseTwo isConditional not.
	self assert: caseTwo statements size equals: 1.

	self assert: caseTwo nextBlock equals: caseThree.

	self assert: caseThree isFinal not.
	self assert: caseThree isConditional not.
	self assert: caseThree statements size equals: 2.

	self assert: caseThree nextBlock equals: finalBlock.

	self assert: defaultCase isFinal not.
	self assert: defaultCase isConditional not.
	self assert: defaultCase statements size equals: 1.

	self
		assert: (switchBlock nextBlockForValue: 'default') nextBlock
		equals: finalBlock.

	self assert: finalBlock isFinal.
	self assert: finalBlock isConditional not.
	self assert: finalBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testSwitchWithDefaultMethodCorrectCFG [

	| startBlock switchBlock caseOne caseTwo caseThree finalBlock defaultCase |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self switchWithDefaultMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	self assert: startBlock nextBlock isConditional.

	switchBlock := startBlock nextBlock.

	self assert: switchBlock isStart not.
	self assert: switchBlock isConditional.
	self assert: switchBlock statements size equals: 1.
	self assert: switchBlock nextBlocks size equals: 4.

	caseOne := switchBlock nextBlockForValue: '(i) = 1'.
	caseTwo := switchBlock nextBlockForValue: '(i) = 2'.
	caseThree := switchBlock nextBlockForValue: '(i) = 3'.
	defaultCase := switchBlock nextBlockForValue: 'default'.

	self assert: caseOne isConditional not.
	self assert: caseOne isFinal not.
	self assert: caseOne statements size equals: 1.

	self assert: caseOne nextBlock equals: caseTwo.

	self assert: caseTwo isFinal not.
	self assert: caseTwo isConditional not.
	self assert: caseTwo statements size equals: 1.

	self assert: caseTwo nextBlock equals: caseThree.

	self assert: caseThree isFinal not.
	self assert: caseThree isConditional not.
	self assert: caseThree statements size equals: 1.

	self assert: caseThree nextBlock equals: defaultCase.

	self assert: defaultCase isFinal not.
	self assert: defaultCase isConditional not.
	self assert: defaultCase statements size equals: 1.

	finalBlock := defaultCase nextBlock.

	self
		assert: (switchBlock nextBlockForValue: 'default') nextBlock
		equals: finalBlock.

	self assert: finalBlock isFinal.
	self assert: finalBlock isConditional not.
	self assert: finalBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testTernaryOperatorMethodCorrectCFG [

	| startBlock ternaryBlock trueBlock falseBlock nextBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self ternaryOperatorMethodSource).
			
	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 3.
	
	ternaryBlock := startBlock nextBlock.
	
	self assert: ternaryBlock isConditional.
	self assert: ternaryBlock nextBlocks size equals: 2.
	
	trueBlock := ternaryBlock nextBlockForValue: true.
	falseBlock := ternaryBlock nextBlockForValue: false.
	
	self assert: trueBlock isFinal not.
	self assert: trueBlock isConditional not.
	self assert: trueBlock statements size equals: 1.
	
	self assert: falseBlock isFinal not.
	self assert: falseBlock isConditional not.
	self assert: falseBlock statements size equals: 1.
	
	self assert: trueBlock nextBlock equals: falseBlock nextBlock.
	
	nextBlock := trueBlock nextBlock.
	
	self assert: nextBlock isFinal.
	self assert: nextBlock isConditional not.
	self assert: nextBlock statements size equals: 1
	
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testTernaryOperatorMethodInReturnCorrectCFG [

	| startBlock ternaryBlock trueBlock falseBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self ternaryOperatorMethodInReturnSource).
			
	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	
	ternaryBlock := startBlock nextBlock.
	
	self assert: ternaryBlock isConditional.
	self assert: ternaryBlock nextBlocks size equals: 2.
	
	trueBlock := ternaryBlock nextBlockForValue: true.
	falseBlock := ternaryBlock nextBlockForValue: false.
	
	self assert: trueBlock isFinal.
	self assert: trueBlock isConditional not.
	self assert: trueBlock statements size equals: 1.
	
	self assert: falseBlock isFinal.
	self assert: falseBlock isConditional not.
	self assert: falseBlock statements size equals: 1

	
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testTernaryOperatorMethodNestedCorrectCFG [

	| startBlock ternaryBlock ternaryBlockNested ternaryBlockNestedNested trueBlock falseBlock nextBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self ternaryOperatorMethodNestedSource).
			
	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 3.
	
	ternaryBlock := startBlock nextBlock.
	
	self assert: ternaryBlock isConditional.
	self assert: ternaryBlock nextBlocks size equals: 2.
	
	ternaryBlockNested := ternaryBlock nextBlockForValue: true.
	falseBlock := ternaryBlock nextBlockForValue: false.
	
	self assert: ternaryBlockNested isFinal not.
	self assert: ternaryBlockNested isConditional.
	self assert: ternaryBlockNested nextBlocks size equals: 2.
	
	self assert: falseBlock isFinal not.
	self assert: falseBlock isConditional not.
	self assert: falseBlock statements size equals: 1.
	
	trueBlock := ternaryBlockNested nextBlockForValue: true.
	ternaryBlockNestedNested := ternaryBlockNested nextBlockForValue: false.
	
	self assert: trueBlock isFinal not.
	self assert: trueBlock isConditional not.
	self assert: trueBlock statements size equals: 1.
	
	self assert: trueBlock nextBlock equals: falseBlock nextBlock.
	
	self assert: ternaryBlockNested isFinal not.
	self assert: ternaryBlockNested isConditional.
	self assert: ternaryBlockNested nextBlocks size equals: 2.
	
	trueBlock := ternaryBlockNestedNested nextBlockForValue: true.
	falseBlock := ternaryBlockNestedNested nextBlockForValue: false.
	
	self assert: trueBlock isFinal not.
	self assert: trueBlock isConditional not.
	self assert: trueBlock statements size equals: 1.
	
	self assert: falseBlock isFinal not.
	self assert: falseBlock isConditional not.
	self assert: falseBlock statements size equals: 1.
	
	self assert: trueBlock nextBlock equals: falseBlock nextBlock.
	
	nextBlock := trueBlock nextBlock.
	
	self assert: nextBlock isFinal.
	self assert: nextBlock isConditional not.
	self assert: nextBlock statements size equals: 1
	
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testThrowInsideTryMethodCorrectCFG [

	| startBlock tryBlock throwBlock catchIOBlock defaultCatchBlock finalBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self throwWithinTryMethodSource).
			
	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	
	tryBlock := startBlock nextBlock.
	
	self assert: tryBlock isConditional.
	self assert: tryBlock nextBlocks size equals: 3.
	
	throwBlock := tryBlock nextBlockForValue: '[No exceptions]'.
	catchIOBlock := tryBlock nextBlockForValue: 'Catches (IOException)'.
	defaultCatchBlock := tryBlock nextBlockForValue: 'Catches (Exception)'.
	
	self assert: throwBlock isConditional.
	self assert: throwBlock nextBlocks size equals: 3.
	self assert: (throwBlock nextBlockForValue: 'Catched as (IOException)') equals: catchIOBlock.
	self assert: (throwBlock nextBlockForValue: 'Catched as (Exception)') equals: defaultCatchBlock.
	self assert: (throwBlock nextBlockForValue: '[Uncatched exception]') isNotNil.
	
	finalBlock := throwBlock nextBlockForValue: '[Uncatched exception]'.
	
	self assert: finalBlock isConditional not.
	self assert: finalBlock isFinal.
	self assert: finalBlock statements isEmpty
	
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testThrowMethodCorrectCFG [

	| startBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self throwMethodSource).
			
	self assert: startBlock isStart.
	self assert: startBlock nextBlock isNullBlock.
	self assert: startBlock statements size equals: 3
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testTransformCorrectCFG [

	| startBlock firstReturnBlock nextBlock noSuchMethodExceptionBlock illegalAccessExceptionBlock invocationTargetExceptionBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self transformSource).

	"testing the if starting the method"
	self assert: startBlock isStart.
	self assert: startBlock isConditional.
	self assert: startBlock statements size equals: 1.

	firstReturnBlock := startBlock nextBlockForValue: true.
	nextBlock := startBlock nextBlockForValue: false.

	"testing the then value of the if in the beginning of the method"
	self assert: firstReturnBlock isFinal.
	self assert: firstReturnBlock isConditional not.
	self assert: firstReturnBlock statements size equals: 1.

	noSuchMethodExceptionBlock := nextBlock nextBlockForValue:
		                              'Catches (NoSuchMethodException)'.
	illegalAccessExceptionBlock := nextBlock nextBlockForValue:
		                               'Catches (IllegalAccessException)'.
	invocationTargetExceptionBlock := nextBlock nextBlockForValue:
		                                  'Catches (InvocationTargetException)'.

	"testing every statement in the try except for the last one (the return)"
	[ nextBlock isFinal ] whileFalse: [
			self assert: nextBlock isConditional.
			self assert: nextBlock statements size equals: 1.
			self
				assert:
				(nextBlock nextBlockForValue: 'Catches (NoSuchMethodException)')
				equals: noSuchMethodExceptionBlock.
			self
				assert:
				(nextBlock nextBlockForValue: 'Catches (IllegalAccessException)')
				equals: illegalAccessExceptionBlock.
			self
				assert:
				(nextBlock nextBlockForValue:
					 'Catches (InvocationTargetException)')
				equals: invocationTargetExceptionBlock.
			nextBlock := nextBlock nextBlockForValue: '[No exceptions]' ].

	"testing the return statement within the try statement"
	self assert: nextBlock statements size equals: 1.
	self assert: nextBlock isFinal.
	self assert: nextBlock isConditional.
	self
		assert:
		(nextBlock nextBlockForValue: 'Catches (NoSuchMethodException)')
		equals: noSuchMethodExceptionBlock.
	self
		assert:
		(nextBlock nextBlockForValue: 'Catches (IllegalAccessException)')
		equals: illegalAccessExceptionBlock.
	self
		assert:
		(nextBlock nextBlockForValue: 'Catches (InvocationTargetException)')
		equals: invocationTargetExceptionBlock.
	self
		assert: (nextBlock nextBlockForValue: '[No exceptions]') class
		equals: FASTNullBlock.

	"testing that catches are final blocks (because of their throw statements)"
	self assert: noSuchMethodExceptionBlock isFinal.
	self assert: illegalAccessExceptionBlock isFinal.
	self assert: invocationTargetExceptionBlock isFinal
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testTryCatchMethodCorrectCFG [

	| startBlock nextBlock catchBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self tryCatchMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock isConditional not.
	self assert: startBlock statements size equals: 1.

	nextBlock := startBlock nextBlock.
	catchBlock := nextBlock nextBlockForValue: 'Catches (Exception)'.

	[ nextBlock isFinal ] whileFalse: [
			self assert: nextBlock isConditional.
			self assert: nextBlock statements size equals: 1.
			self
				assert: (nextBlock nextBlockForValue: 'Catches (Exception)')
				equals: catchBlock.
			nextBlock := nextBlock nextBlockForValue: '[No exceptions]' ].

	self assert: nextBlock statements size equals: 1.
	self assert: nextBlock isFinal.
	self assert: nextBlock isConditional not.
	
	self assert: catchBlock nextBlock equals: nextBlock.
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testTryCatchWithForAndBreakMethodCorrectCFG [

	| startBlock nextBlock catchBlock forBlock blockAfterFor thenBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self tryCatchWithForAndBreakMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock isConditional not.
	self assert: startBlock statements size equals: 1.

	nextBlock := startBlock nextBlock.
	catchBlock := nextBlock nextBlockForValue: 'Catches (Exception)'.

	[ nextBlock isFinal ] whileFalse: [
			self assert: nextBlock isConditional.
			self assert: nextBlock statements size equals: 1.
			nextBlock firstStatement class = FASTJavaForStatement
				ifTrue: [
						forBlock := nextBlock.
						thenBlock := nextBlock nextBlockForValue: true.
						nextBlock := nextBlock nextBlockForValue: false.
						blockAfterFor := nextBlock ]
				ifFalse: [
						self
							assert: (nextBlock nextBlockForValue: 'Catches (Exception)')
							equals: catchBlock.
						nextBlock := nextBlock nextBlockForValue: '[No exceptions]' ] ].

	"testing final block"
	self assert: nextBlock statements size equals: 1.
	self assert: nextBlock isConditional not.
	self assert: nextBlock isFinal.
	
	self assert: catchBlock nextBlock equals: nextBlock.

	"testing the for statement"
	self assert: thenBlock isConditional.
	self assert: thenBlock statements size equals: 1.
	self
		assert: (thenBlock nextBlockForValue: 'Catches (Exception)')
		equals: catchBlock.

	"testing the if block"
	nextBlock := thenBlock nextBlockForValue: '[No exceptions]'.
	self assert: nextBlock isConditional.
	self assert: nextBlock statements size equals: 1.
	self assert: (nextBlock nextBlockForValue: false) equals: forBlock.

	nextBlock := nextBlock nextBlockForValue: true.
	self assert: nextBlock isConditional.
	self assert: nextBlock statements size equals: 1.
	self
		assert: (nextBlock nextBlockForValue: 'Catches (Exception)')
		equals: catchBlock.

	"testing the break statement"
	nextBlock := nextBlock nextBlockForValue: '[No exceptions]'.
	self assert: nextBlock isConditional not.
	self assert: nextBlock nextBlock equals: blockAfterFor
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testTryWithFinallyCorrectCFG [

	| startBlock nextBlock catchBlock finallyBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self tryWithFinallyMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock isConditional not.
	self assert: startBlock statements size equals: 1.

	nextBlock := startBlock nextBlock.
	catchBlock := nextBlock nextBlockForValue: 'Catches (Exception)'.
	finallyBlock := catchBlock nextBlock.

	[ nextBlock isFinal ] whileFalse: [
			self assert: nextBlock isConditional.
			self assert: nextBlock statements size equals: 1.
			self
				assert: (nextBlock nextBlockForValue: 'Catches (Exception)')
				equals: catchBlock.
			nextBlock := nextBlock nextBlockForValue: '[No exceptions]' ].

	self assert: nextBlock statements size equals: 2.
	self assert: nextBlock isFinal.
	self assert: nextBlock isConditional not.
	self assert: nextBlock equals: finallyBlock
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testTryWithMultipleCatchesMethodCorrectCFG [

	| startBlock nextBlock catchIOBlock defaultCatchBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self tryWithMultipleCatchesMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock isConditional not.
	self assert: startBlock statements size equals: 1.

	nextBlock := startBlock nextBlock.
	catchIOBlock := nextBlock nextBlockForValue: 'Catches (IOException)'.
	defaultCatchBlock := nextBlock nextBlockForValue: 'Catches (Exception)'.

	[ nextBlock isFinal ] whileFalse: [
			self assert: nextBlock isConditional.
			self assert: nextBlock statements size equals: 1.
			self
				assert: (nextBlock nextBlockForValue: 'Catches (Exception)')
				equals: defaultCatchBlock.
			self
				assert: (nextBlock nextBlockForValue: 'Catches (IOException)')
				equals: catchIOBlock.
			nextBlock := nextBlock nextBlockForValue: '[No exceptions]' ].

	self assert: nextBlock statements size equals: 1.
	self assert: nextBlock isFinal.
	self assert: nextBlock isConditional not.
	
	self assert: defaultCatchBlock nextBlock equals: nextBlock.
	self assert: catchIOBlock nextBlock equals: nextBlock
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testTwoReturnsCorrectCFG [

	| startBlock conditionalBlock thenBlock nextBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self twoReturnsMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	thenBlock := conditionalBlock nextBlockForValue: true.
	nextBlock := conditionalBlock nextBlockForValue: false.

	self assert: thenBlock isConditional not.
	self assert: thenBlock isFinal.
	self assert: thenBlock statements size equals: 1.
	
	self assert: nextBlock isFinal.
	self assert: nextBlock statements size equals: 1
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> testWhileMethodCorrectCFG [

	| startBlock conditionalBlock thenBlock nextBlock |
	startBlock := cfgBuilder buildCFGForModel:
		              (self getFASTMethodEntityForSource:
			               self whileMethodSource).

	self assert: startBlock isStart.
	self assert: startBlock statements size equals: 2.
	self assert: startBlock nextBlock isConditional.

	conditionalBlock := startBlock nextBlock.

	self assert: conditionalBlock isStart not.
	self assert: conditionalBlock isConditional.
	self assert: conditionalBlock statements size equals: 1.
	self assert: conditionalBlock nextBlocks size equals: 2.

	thenBlock := conditionalBlock nextBlockForValue: true.
	nextBlock := conditionalBlock nextBlockForValue: false.

	self assert: thenBlock isConditional not.
	self assert: thenBlock isFinal not.
	self assert: thenBlock statements size equals: 2.

	self assert: thenBlock nextBlock equals: conditionalBlock.
	
	self assert: nextBlock isFinal.
	self assert: nextBlock statements size equals: 1
]

{ #category : 'nil' }
FASTJavaCFGVisitorTest >> throwMethodSource [

	^ 
'public void simpleMethod() throws IOException {
	int i = 0;
	i = i + 4;
	throw new IOException("bye bye");
}'
]

{ #category : 'nil' }
FASTJavaCFGVisitorTest >> throwWithinTryMethodSource [

	^ 
'public void simpleMethod() throws IOException {
	int i = 0;
	i = i + 4;
	try { 
		System.out.println("Following statement has been written by a professional, don''t try to reproduce this at home.");
		throw new IOException("bye bye");
	} 
	catch (IOException e) {
		System.out.println("IOException");
		e.printStackTrace();
	}
	catch (Exception e) {
		System.out.println("Useless");
		e.printStackTrace();
	}
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> transformSource [

	^ 
'public Object transform(Object input) {
        if (input == null) {
            return null;
        }
        try {
            Class cls = input.getClass();
            Method method = cls.getMethod(iMethodName, iParamTypes);
            return method.invoke(input, iArgs);
                
        } catch (NoSuchMethodException ex) {
            throw new FunctorException("InvokerTransformer: The method ''" + iMethodName + "'' on ''" + input.getClass() + "'' does not exist");
        } catch (IllegalAccessException ex) {
            throw new FunctorException("InvokerTransformer: The method ''" + iMethodName + "'' on ''" + input.getClass() + "'' cannot be accessed");
        } catch (InvocationTargetException ex) {
            throw new FunctorException("InvokerTransformer: The method ''" + iMethodName + "'' on ''" + input.getClass() + "'' threw an exception", ex);
        }
    }'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> tryCatchMethodSource [

	^ 
'public boolean tryCatchMethod(ObjectInputStream ois) {
	System.out.println("Hello World");
	try {
			System.out.println("start reading file");
			ois.readObject();
			ois.close();
			System.out.println("successful file reading");
	}
	catch (Exception e) {
			System.out.println("file not read");
			e.printStackTrace();
	}
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> tryCatchWithForAndBreakMethodSource [

	^ 
'public boolean tryCatchMethod() {
	System.out.println("Hello World");
	try {
			System.out.println("start reading file");
			ois.readObject();
			for (int i = 0; i < 3; i++) { 
				System.out.println("Why not a for here");
				if (i == 2) { 
					System.out.println("and a break there");
					break;
				}
			}
			ois.close();
			System.out.println("successful file reading");
	}
	catch (Exception e) {
			System.out.println("file not read");
			e.printStackTrace();
	}
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> tryWithFinallyMethodSource [

	^ 
'public boolean tryCatchMethod(ObjectInputStream ois) {
	System.out.println("Hello World");
	try {
			System.out.println("start reading file");
			ois.readObject();
			System.out.println("successful file reading");
	}
	catch (Exception e) {
			System.out.println("file not read");
			e.printStackTrace();
	}
	finally { 
			ois.close(); 
	}
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> tryWithMultipleCatchesMethodSource [

	^ 
'public boolean tryCatchMethod() {
	System.out.println("Hello World");
	try {
			System.out.println("start reading file");
			ois.readObject();
			ois.close();
			System.out.println("successful file reading");
	}
	catch (IOException e) {
			System.out.println("IOException");
			e.printStackTrace();
		}
	catch (Exception e) {
			System.out.println("file not read");
			e.printStackTrace();
	}
	return true;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> twoReturnsMethodSource [

	^ 
'public int ifElseMethod() {
	int i = 0;
	i = i + 4;
	if (i == 4) {
		return i;
	} 
	return i;
}'
]

{ #category : 'as yet unclassified' }
FASTJavaCFGVisitorTest >> whileMethodSource [

	^ 
'public boolean whileMethod() {
	System.out.println("Hello World!");
	int i = 0;
	while (i < 5) {
		System.out.println(i);
		i++;
	}
	return true;
}'
]
