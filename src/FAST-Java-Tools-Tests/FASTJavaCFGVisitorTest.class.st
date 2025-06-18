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
FASTJavaCFGVisitorTest >> testSimpleInstructionsGivesOneBlock [

	| block |
	self cfgFor: 'void meth() {
	int i = 5;
	System.out.println(i);
}'.

	self assert: visitor basicBlocks size equals: 1.

	block := visitor basicBlocks anyOne.
	self assert: block isStart.
	self assert: block isFinal

]

{ #category : 'tests' }
FASTJavaCFGVisitorTest >> testSimpleReturnGivesOneBlock [

	| block |
	self cfgFor: 'void meth() {return;}'.

	self assert: visitor basicBlocks size equals: 1.

	block := visitor basicBlocks anyOne.
	self assert: block isStart.
	self assert: block isFinal

]
