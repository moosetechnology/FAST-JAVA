"
I check that a switch whose block is in arrow form is imported as a switch statement when it is used as one (JLS 14.11.1), and not as a switch expression.
"
Class {
	#name : 'JavaSmaCCSwitchStatementWithRulesTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCSwitchStatementWithRulesTest >> javaMethod [

	^ 'void switchStatement(int value) {
	switch (value) {
		case 1, 2 -> first();
		case 3 -> { second(); }
		default -> last();
	}
}'
]

{ #category : 'tests' }
JavaSmaCCSwitchStatementWithRulesTest >> testIsASwitchStatement [

	self assert: (fastModel allWithType: FASTJavaSwitchExpression) isEmpty.
	self assert: (fastModel allWithType: FASTJavaSwitchStatement) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCSwitchStatementWithRulesTest >> testSwitchRuleLabels [

	| rules |
	rules := (fastModel allWithType: FASTJavaSwitchStatement) anyOne rules.
	self assert: rules first label caseExpressions size equals: 2.
	self assert: rules second label caseExpressions size equals: 1.
	self assert: rules third label caseExpressions isEmpty
]

{ #category : 'tests' }
JavaSmaCCSwitchStatementWithRulesTest >> testSwitchRuleOwner [

	| switchStatement |
	switchStatement := (fastModel allWithType: FASTJavaSwitchStatement) anyOne.
	switchStatement rules do: [ :rule | self assert: rule switchOwner identicalTo: switchStatement ]
]

{ #category : 'tests' }
JavaSmaCCSwitchStatementWithRulesTest >> testSwitchStatementRules [

	| switchStatement |
	switchStatement := (fastModel allWithType: FASTJavaSwitchStatement) anyOne.
	self assert: switchStatement cases isEmpty.
	self assert: switchStatement rules size equals: 3.
	self assert: switchStatement condition class equals: FASTJavaVariableExpression
]
