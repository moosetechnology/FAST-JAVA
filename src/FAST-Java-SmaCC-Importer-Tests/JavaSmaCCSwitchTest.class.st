Class {
	#name : #JavaSmaCCSwitchTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'switchMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCSwitchTest >> methodSwitch [
	^ 
'void switchMethod() {
	switch(hello) { 
		case HELLO:
			doStuff();
			break;
		case WORLD:
			doing();
		default:
			done();
	}
}
'
]

{ #category : #running }
JavaSmaCCSwitchTest >> setUp [
	super setUp.
	switchMethod := (self parseMethod: 'switch') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCSwitchTest >> testCaseSize [
	self assert: (switchMethod mooseModel allWithSubTypesOf: FASTJavaCaseStatement) size equals: 3
]

{ #category : #tests }
JavaSmaCCSwitchTest >> testDefaultCaseSize [
	self assert: (switchMethod mooseModel allWithType: FASTJavaDefaultCaseStatement) size equals: 1
]

{ #category : #tests }
JavaSmaCCSwitchTest >> testExpressionsSize [
	self assert: ((switchMethod mooseModel allWithType: FASTJavaLabeledCaseStatement) select: [:case | case label name = 'HELLO'  ]) anyOne statements size equals: 2. 
	self assert: ((switchMethod mooseModel allWithType: FASTJavaLabeledCaseStatement) select: [:case | case label name = 'WORLD'  ]) anyOne statements size equals: 1.
	self assert: (switchMethod mooseModel allWithType: FASTJavaDefaultCaseStatement) anyOne statements size equals: 1.
]

{ #category : #tests }
JavaSmaCCSwitchTest >> testLabeledCaseSize [
	self assert: (switchMethod mooseModel allWithType: FASTJavaLabeledCaseStatement) size equals: 2
]

{ #category : #tests }
JavaSmaCCSwitchTest >> testLabeledValue [
	self assert: (switchMethod mooseModel allWithType: FASTJavaLabeledCaseStatement) first label name equals: 'HELLO'.
	self assert: (switchMethod mooseModel allWithType: FASTJavaLabeledCaseStatement) second label name equals: 'WORLD'
]

{ #category : #tests }
JavaSmaCCSwitchTest >> testSwitchSize [
	self assert: (switchMethod mooseModel allWithType: FASTJavaSwitchStatement) size equals: 1 
]
