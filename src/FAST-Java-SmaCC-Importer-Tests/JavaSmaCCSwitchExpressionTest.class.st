Class {
	#name : 'JavaSmaCCSwitchExpressionTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCSwitchExpressionTest >> javaMethod [

	^ 'int switchExpression(int value) {
	return switch (value) {
		case 1, 2 -> 10;
		case 3 -> { yield 30; }
		default -> 20;
	};
}'
]

{ #category : 'tests' }
JavaSmaCCSwitchExpressionTest >> testSwitchExpression [

	| switchExpression |
	switchExpression := (fastModel allWithType: FASTJavaSwitchExpression) anyOne.
	self assert: switchExpression condition class equals: FASTJavaVariableExpression.
	self assert: switchExpression rules size equals: 3
]

{ #category : 'tests' }
JavaSmaCCSwitchExpressionTest >> testSwitchRuleBodies [

	| rules |
	rules := (fastModel allWithType: FASTJavaSwitchExpression) anyOne rules.
	self assert: rules first body class equals: FASTJavaIntegerLiteral.
	self assert: rules second body class equals: FASTJavaStatementBlock.
	self assert: rules third body class equals: FASTJavaIntegerLiteral
]

{ #category : 'tests' }
JavaSmaCCSwitchExpressionTest >> testSwitchRuleLabels [

	| rules |
	rules := (fastModel allWithType: FASTJavaSwitchExpression) anyOne rules.
	self assert: rules first label caseExpressions size equals: 2.
	self assert: rules second label caseExpressions size equals: 1.
	self assert: rules third label caseExpressions isEmpty
]

{ #category : 'tests' }
JavaSmaCCSwitchExpressionTest >> testYieldStatement [

	| yieldStatement |
	self assert: (fastModel allWithType: FASTJavaYieldStatement) size equals: 1.
	yieldStatement := (fastModel allWithType: FASTJavaYieldStatement) anyOne.
	self assert: yieldStatement expression class equals: FASTJavaIntegerLiteral
]
