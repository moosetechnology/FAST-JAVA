Class {
	#name : 'FASTJavaCFGVisitorTest',
	#superclass : 'FASTJavaAbstracVisitorTest',
	#instVars : [
		'visitor'
	],
	#category : 'FAST-Java-Tools-Tests-CFG',
	#package : 'FAST-Java-Tools-Tests',
	#tag : 'CFG'
}

{ #category : 'running' }
FASTJavaCFGVisitorTest >> cfgFor: aSourceCode [

	(self methodAST: aSourceCode)
		accept: visitor
]

{ #category : 'running' }
FASTJavaCFGVisitorTest >> findBasicBlocks: aClass with: aPharoBooleanBlock [

	^visitor basicBlocks
		select: [ :aBasicBlock |
			(aBasicBlock class = aClass) and:
			[ aPharoBooleanBlock value: aBasicBlock ]
		]
]

{ #category : 'running' }
FASTJavaCFGVisitorTest >> setUp [

	super setUp.

	visitor := FASTJavaCFGVisitor new
]

{ #category : 'tests' }
FASTJavaCFGVisitorTest >> testIfStatementInLoop [

	| block |
	self cfgFor: 'void meth() {
	for (int i=1; i < 10; i++)
		if (i > 3)
			System.out.println("after 3");
		else
			System.out.println("before 3");
}'.

	self assert: visitor basicBlocks size equals: 4.

	block := visitor basicBlocks first.
	self assert: block isStart.
	self assert: block isConditional.
	self assert: block isFinal.

	self assert: (visitor basicBlocks first nextBlockForValue: 'true') equals: visitor basicBlocks second.

	block := visitor basicBlocks second.
	self deny: block isStart.
	self assert: block isConditional.
	self deny: block isFinal.

	self assert: (visitor basicBlocks second nextBlockForValue: 'true') equals: visitor basicBlocks third.

	block := visitor basicBlocks third.
	self deny: block isStart.
	self deny: block isConditional.
	self deny: block isFinal.

	self assert: (visitor basicBlocks second nextBlockForValue: 'false') equals: visitor basicBlocks fourth.

	block := visitor basicBlocks fourth.
	self deny: block isStart.
	self deny: block isConditional.
	self deny: block isFinal.

]

{ #category : 'tests' }
FASTJavaCFGVisitorTest >> testIfStatementNoElse [

	| block |
	self cfgFor: 'void meth() {
	if (5 > 3)
		System.out.println("all is good!");
}'.

	self assert: visitor basicBlocks size equals: 2.

	block := visitor basicBlocks first.
	self assert: block isStart.
	self assert: block isConditional.
	self assert: block isFinal.

	self assert: (block nextBlockForValue: 'true') equals: visitor basicBlocks second.

	block := visitor basicBlocks second.
	self deny: block isStart.
	self deny: block isConditional.
	self assert: block isFinal.

]

{ #category : 'tests' }
FASTJavaCFGVisitorTest >> testIfStatementWithElse [

	| block |
	self cfgFor: 'void meth() {
	if (5 > 3)
		System.out.println("all is good!");
	else
		System.out.println("WTF ?!");
}'.

	self assert: visitor basicBlocks size equals: 3.

	block := visitor basicBlocks first.
	self assert: block isStart.
	self assert: block isConditional.
	self deny: block isFinal.

	self assert: (visitor basicBlocks first nextBlockForValue: 'true') equals: visitor basicBlocks second.

	block := visitor basicBlocks second.
	self deny: block isStart.
	self deny: block isConditional.
	self assert: block isFinal.

	self assert: (visitor basicBlocks first nextBlockForValue: 'false') equals: visitor basicBlocks third.

	block := visitor basicBlocks third.
	self deny: block isStart.
	self deny: block isConditional.
	self assert: block isFinal.

]

{ #category : 'tests' }
FASTJavaCFGVisitorTest >> testLoopFor [

	| block |
	self cfgFor: 'void meth() {
	for (int i=5; i < 10; i++)
		System.out.println(i);
}'.

	self assert: visitor basicBlocks size equals: 2.

	block := visitor basicBlocks first.
	self assert: block isStart.
	self assert: block isConditional.
	self assert: block isFinal.

	self assert: (block nextBlockForValue: 'true') equals: visitor basicBlocks second.

	block := visitor basicBlocks second.
	self deny: block isStart.
	self deny: block isFinal.

]

{ #category : 'tests' }
FASTJavaCFGVisitorTest >> testLoopForeach [

	| block |
	self cfgFor: 'void meth() {
	ArrayList<Something> collection;
	for (Something each : collection)
		System.out.println(i);
}'.

	self assert: visitor basicBlocks size equals: 3.

	block := visitor basicBlocks first.
	self assert: block isStart.
	self deny: block isConditional.
	self deny: block isFinal.

	self assert: block nextBlock equals: visitor basicBlocks second.

	block := visitor basicBlocks second.
	self deny: block isStart.
	self assert: block isConditional.
	self assert: block isFinal.

	self assert: (block nextBlockForValue: 'true') equals: visitor basicBlocks third.

	block := visitor basicBlocks third.
	self deny: block isStart.
	self deny: block isConditional.
	self deny: block isFinal.

]

{ #category : 'tests' }
FASTJavaCFGVisitorTest >> testLoopWhile [

	| block |
	self cfgFor: 'void meth() {
	int i = 1;
	while (i < 10) {
		System.out.println(i);
		i++;
	}
}'.

	self assert: visitor basicBlocks size equals: 3.

	block := visitor basicBlocks first.
	self assert: block isStart.
	self deny: block isConditional.
	self deny: block isFinal.

	self assert: block nextBlock equals: visitor basicBlocks second.

	block := visitor basicBlocks second.
	self deny: block isStart.
	self assert: block isConditional.
	self assert: block isFinal.

	self assert: (block nextBlockForValue: 'true') equals: visitor basicBlocks third.

	block := visitor basicBlocks third.
	self deny: block isStart.
	self deny: block isConditional.
	self deny: block isFinal.

]

{ #category : 'tests' }
FASTJavaCFGVisitorTest >> testLoopWithBreak [

	| block |
	self cfgFor: 'void meth() {
	for (int i=5; i < 10; i++)
		if (i % 2 == 0)
			break;
}'.

	self assert: visitor basicBlocks size equals: 3.

	block := visitor basicBlocks first.
	self assert: block isStart.
	self assert: block isConditional.
	self assert: block isFinal.

	self assert: (visitor basicBlocks first nextBlockForValue: 'true') equals: visitor basicBlocks second.

	block := visitor basicBlocks second.
	self deny: block isStart.
	self assert: block isConditional.
	self deny: block isFinal.

	self assert: (visitor basicBlocks second nextBlockForValue: 'true') equals: visitor basicBlocks third.

	block := visitor basicBlocks third.
	self deny: block isStart.
	self deny: block isConditional.
	self assert: block isFinal.

	self assert: (visitor basicBlocks second nextBlockForValue: 'false') equals: visitor basicBlocks first.

]

{ #category : 'tests' }
FASTJavaCFGVisitorTest >> testSimpleInstructionsGivesOneBlock [

	| block |
	self cfgFor: 'void meth() {
	int i = 5;
	System.out.println(i);
}'.

	self assert: visitor basicBlocks size equals: 1.

	block := visitor basicBlocks anyOne.
	self assert: block isStart.
	self assert: block isFinal.
	self assert: block statements size equals: 2

]

{ #category : 'tests' }
FASTJavaCFGVisitorTest >> testSimpleReturnGivesOneBlock [

	| block |
	self cfgFor: 'void meth() {return;}'.

	self assert: visitor basicBlocks size equals: 1.

	block := visitor basicBlocks anyOne.
	self assert: block isStart.
	self assert: block isFinal.
	self assert: block statements size equals: 1

]
