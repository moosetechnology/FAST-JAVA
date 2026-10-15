Class {
	#name : 'JavaSmaCCSwitchTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCSwitchTest >> javaMethod [
	^ 'void switchMethod() {
	switch(hello) { 
		case HELLO:
			doStuff();
			break;
		case WORLD:
			doing();
		default:
			done();
	}
}'
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
JavaSmaCCSwitchTest >> testDeprecatedLabel [

	| labeledCase expected actual |
	labeledCase := (fastModel allWithType: FASTJavaLabeledCaseStatement) first.
	expected := labeledCase labels first caseExpressions first.
	actual := [ labeledCase label ]
		          on: Deprecation
		          do: [ :notification | notification resume ].
	self assert: actual identicalTo: expected
]

{ #category : 'tests' }
JavaSmaCCSwitchTest >> testDeprecatedLabelSetter [

	| labeledCase replacement actual |
	labeledCase := (fastModel allWithType: FASTJavaLabeledCaseStatement) first.
	replacement := FASTJavaVariableExpression new
		               name: 'replacement';
		               yourself.
	[ labeledCase label: replacement ]
		on: Deprecation
		do: [ :notification | notification resume ].
	self assert: labeledCase labels size equals: 1.
	actual := labeledCase labels first caseExpressions first.
	self assert: actual identicalTo: replacement
]

{ #category : 'tests' }
JavaSmaCCSwitchTest >> testExpressionsSize [

	self
		assert:
			((fastModel allWithType: FASTJavaLabeledCaseStatement) select: [ :case |
				 case labels first caseExpressions first name = 'HELLO' ]) anyOne statements size
		equals: 2.
	self
		assert:
			((fastModel allWithType: FASTJavaLabeledCaseStatement) select: [ :case |
				 case labels first caseExpressions first name = 'WORLD' ]) anyOne statements size
		equals: 1.
	self assert: (fastModel allWithType: FASTJavaDefaultCaseStatement) anyOne statements size equals: 1
]

{ #category : 'tests' }
JavaSmaCCSwitchTest >> testLabeledCaseSize [
	self assert: (fastModel allWithType: FASTJavaLabeledCaseStatement) size equals: 2
]

{ #category : 'tests' }
JavaSmaCCSwitchTest >> testLabeledValue [

	self assert: (fastModel allWithType: FASTJavaLabeledCaseStatement) first labels first caseExpressions first name equals: 'HELLO'.
	self assert: (fastModel allWithType: FASTJavaLabeledCaseStatement) second labels first caseExpressions first name equals: 'WORLD'
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
