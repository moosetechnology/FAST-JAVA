Class {
	#name : 'JavaSmaCCMultipleSwitchLabelsTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMultipleSwitchLabelsTest >> javaMethod [

	^ 'void multipleLabels(int value) {
	switch (value) {
		case 1, 2:
		case 3:
			foo();
			break;
		default:
			bar();
	}
}'
]

{ #category : 'tests' }
JavaSmaCCMultipleSwitchLabelsTest >> testDefaultLabel [

	| defaultCase |
	defaultCase := (fastModel allWithType: FASTJavaDefaultCaseStatement) anyOne.
	self assert: defaultCase labels size equals: 1.
	self assert: defaultCase labels first caseExpressions isEmpty
]

{ #category : 'tests' }
JavaSmaCCMultipleSwitchLabelsTest >> testMultipleLabelsAndConstants [

	| labeledCase |
	labeledCase := (fastModel allWithType: FASTJavaLabeledCaseStatement) anyOne.
	self assert: labeledCase labels size equals: 2.
	self assert: labeledCase labels first caseExpressions size equals: 2.
	self assert: labeledCase labels second caseExpressions size equals: 1
]
