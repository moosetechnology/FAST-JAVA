Class {
	#name : 'JavaSmaCCParamsMethodTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCParamsMethodTest >> javaMethod [
	
	^ 'void params(int a, float b, double c, int... etc) {
		x = a + b + c;
	}'
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testBlockScope [
	self skip.

	"symbols := OrderedCollection new.
	params statementBlock fastScope do: [ :each | symbols add: each ].
	self assert: symbols size equals: 0"
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testExpressionParent [
	self assert: fastMethod statements first expression parentNode equals: fastMethod statements first
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testExpressionRHSContentType [
	self assert: fastMethod statements first expression expression class equals: FASTJavaInfixOperation
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testExpressionRHSParent [
	self
		assert: fastMethod statements first expression expression rightOperand parentNode
		equals: fastMethod statements first expression expression
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testExpressionRHSType [
	self assert: fastMethod statements first expression expression rightOperand class equals: FASTJavaVariableExpression
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testExpressionType [
	self assert: fastMethod statements first expression class equals: FASTJavaAssignmentExpression
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testFirstParameterName [
	self assert: fastMethod parameters first variable name equals: 'a'
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testFourthParameterName [
	self assert: fastMethod parameters last variable name equals: 'etc'
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testHasVariableArguments [
	self deny: fastMethod parameters first hasVariableArguments.
	self deny: fastMethod parameters second hasVariableArguments.
	self deny: fastMethod parameters third hasVariableArguments.
	self assert: fastMethod parameters last hasVariableArguments
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testParametersCount [
	self assert: fastMethod parameters size equals: 4
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testParametersParent [
	fastMethod parameters do: [ :each | self assert: each parentNode equals: fastMethod ]
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testScope [
	self skip.
	
	"symbols := OrderedCollection new.
	params fastScope do: [:each | symbols add: each].

	self assert: symbols size equals: 3.
	self assert: (symbols count: [:each | each name = 'a']) equals: 1.
	self assert: (symbols count: [:each | each name = 'b']) equals: 1.
	self assert: (symbols count: [:each | each name = 'c']) equals: 1."
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testSecondParameterName [
	self assert: fastMethod parameters second variable name equals: 'b'
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testStatementsCount [
	self assert: fastMethod statements size equals: 1
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testStatementsParent [
	self assert: fastMethod statements last parentNode equals: fastMethod statementBlock
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testStatementsType [
	self assert: fastMethod statements last class equals: FASTJavaExpressionStatement
]

{ #category : 'tests' }
JavaSmaCCParamsMethodTest >> testThirdParameterName [
	self assert: fastMethod parameters third variable name equals: 'c'
]
