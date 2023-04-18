Class {
	#name : #JavaSmaCCParamsMethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'params'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCParamsMethodTest >> methodParams [
	
	^ 'void params(int a, float b, double c) {
		x = a + b + c;
	}'
]

{ #category : #running }
JavaSmaCCParamsMethodTest >> setUp [
	super setUp.
	params := (self parseMethod: 'params') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testBlockScope [
	self flag: 'Should we keep the fastScope ? '
	"symbols := OrderedCollection new.
	params statementBlock fastScope do: [ :each | symbols add: each ].
	self assert: symbols size equals: 0"
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testExpressionParent [
	self assert: params statements first expression parentNode equals: params statements first  
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testExpressionRHSContentType [
	self assert: params statements first expression expression class equals: FASTJavaInfixOperation
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testExpressionRHSParent [
	self
		assert: params statements first expression expression rightOperand parentNode
		equals: params statements first expression expression
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testExpressionRHSType [
	self assert: params statements first expression expression rightOperand class equals: FASTJavaVariableExpression
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testExpressionType [
	self assert: params statements first expression class equals: FASTJavaAssignmentExpression
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testFirstParameterName [
	self assert: params parameters first variable name equals: 'a'.
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testParametersCount [
	self assert: params parameters size equals: 3
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testParametersParent [
	params parameters do: [ :each | self assert: each parentNode equals: params ]
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testScope [
	self flag: 'Should we keep the fastScope ? '
	"symbols := OrderedCollection new.
	params fastScope do: [:each | symbols add: each].

	self assert: symbols size equals: 3.
	self assert: (symbols count: [:each | each name = 'a']) equals: 1.
	self assert: (symbols count: [:each | each name = 'b']) equals: 1.
	self assert: (symbols count: [:each | each name = 'c']) equals: 1."
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testSecondParameterName [
	self assert: params parameters second variable name equals: 'b'.
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testStatementsCount [
	self assert: params statements size equals: 1
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testStatementsParent [
	self assert: params statements last parentNode equals: params statementBlock 
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testStatementsType [
	self assert: params statements last class equals: FASTJavaExpressionStatement 
]

{ #category : #tests }
JavaSmaCCParamsMethodTest >> testThirdParameterName [
	self assert: params parameters third variable name equals: 'c'.
]
