Class {
	#name : 'JavaSmaCCSwitchTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCSwitchTest >> javaMethod [
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

{ #category : 'tests' }
JavaSmaCCSwitchTest >> testCaseSize [
	self assert: (fastMethod mooseModel allWithSubTypesOf: FASTJavaCaseStatement) size equals: 3
]

{ #category : 'tests' }
JavaSmaCCSwitchTest >> testDefaultCaseSize [
	self assert: (fastMethod mooseModel allWithType: FASTJavaDefaultCaseStatement) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCSwitchTest >> testExpressionsSize [
	self assert: ((fastModel allWithType: FASTJavaLabeledCaseStatement) select: [:case | case label name = 'HELLO'  ]) anyOne statements size equals: 2. 
	self assert: ((fastModel allWithType: FASTJavaLabeledCaseStatement) select: [:case | case label name = 'WORLD'  ]) anyOne statements size equals: 1.
	self assert: (fastModel allWithType: FASTJavaDefaultCaseStatement) anyOne statements size equals: 1.
]

{ #category : 'tests' }
JavaSmaCCSwitchTest >> testLabeledCaseSize [
	self assert: (fastModel allWithType: FASTJavaLabeledCaseStatement) size equals: 2
]

{ #category : 'tests' }
JavaSmaCCSwitchTest >> testLabeledValue [
	self assert: (fastModel allWithType: FASTJavaLabeledCaseStatement) first label name equals: 'HELLO'.
	self assert: (fastModel allWithType: FASTJavaLabeledCaseStatement) second label name equals: 'WORLD'
]

{ #category : 'tests' }
JavaSmaCCSwitchTest >> testSwitchCondition [

	| switchStatement |
	switchStatement := (fastModel allWithType:
		                    FASTJavaSwitchStatement) anyOne.
	self assert: switchStatement condition class equals: FASTJavaVariableExpression
]

{ #category : 'tests' }
JavaSmaCCSwitchTest >> testSwitchSize [
	self assert: (fastModel allWithType: FASTJavaSwitchStatement) size equals: 1 
]
