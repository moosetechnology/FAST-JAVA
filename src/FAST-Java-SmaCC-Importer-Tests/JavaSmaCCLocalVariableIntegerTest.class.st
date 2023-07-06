Class {
	#name : #JavaSmaCCLocalVariableIntegerTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testBlockScope [
	self flag: 'Should we keep the fastScope ? '

	"
	symbols := OrderedCollection new.
	aLittleOfVariables statementBlock fastScope do: [:each | symbols add: each].

	self assert: symbols size equals: 1.
	self assert: symbols first name equals: 'x'."
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testReturnStatementExpressionName [
	self assert: fastMethod statementBlock statements second expression name equals: 'x'
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testReturnStatementExpressionType [
	self assert: fastMethod statementBlock statements second expression class equals: FASTJavaIdentifier.
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testScope [
	self flag: 'Should we keep the fastScope ? '
	"symbols := OrderedCollection new.
	aLittleOfVariables fastScope do: [:each | symbols add: each].

	self assert: symbols size equals: 0"
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testStatementsCount [
	self assert: fastMethod statementBlock statements size equals: 2
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testStatementsType [
	self
		assert: fastMethod statements first class equals: FASTJavaVarDeclStatement;
		assert: fastMethod statements last class equals: FASTJavaReturnStatement
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testVariableDeclaratorExpressionParent [
	self assert: fastMethod statements first declarators first expression parentNode equals: fastMethod statements first declarators first
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testVariableDeclaratorExpressionType [
	self assert: fastMethod statements first declarators first expression class equals: FASTJavaIntegerLiteral
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testVariableDeclaratorExpressionValue [
	self assert: fastMethod statements  first declarators first expression primitiveValue equals: '5'
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testVariableDeclaratorType [
	self assert: fastMethod statements first declarators first class equals: FASTJavaVariableDeclarator
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testVariableDeclaratorVariableName [
	self assert: fastMethod statements first declarators first variable name equals: 'x'
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testVariableDeclaratorVariableParent [
	self assert: fastMethod statements first declarators first variable parentNode equals: fastMethod statements first declarators first
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testVariableDeclaratorVariableType [
	self assert: fastMethod statements first declarators first variable class equals: FASTJavaVariableExpression
]

{ #category : #tests }
JavaSmaCCLocalVariableIntegerTest >> testVariableDeclaratorsCount [
	self assert: fastMethod statements first declarators size equals: 1
]
