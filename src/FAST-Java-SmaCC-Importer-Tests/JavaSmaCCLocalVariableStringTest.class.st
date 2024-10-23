Class {
	#name : 'JavaSmaCCLocalVariableStringTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCLocalVariableStringTest >> javaMethod [
	
	^ 'String aLittleOfVariables4() {
		String x = "test";	
		return x;
	}'
]

{ #category : 'tests' }
JavaSmaCCLocalVariableStringTest >> testVariableDeclaratorExpressionParent4 [
	self
		assert: fastMethod statementBlock statements first declarators first expression parentNode
		equals: fastMethod statementBlock statements first declarators first
]

{ #category : 'tests' }
JavaSmaCCLocalVariableStringTest >> testVariableDeclaratorExpressionType4 [
	self assert: fastMethod statementBlock statements first declarators first expression class equals: FASTJavaStringLiteral
]

{ #category : 'tests' }
JavaSmaCCLocalVariableStringTest >> testVariableDeclaratorExpressionValue4 [
	self assert: fastMethod statementBlock statements first declarators first expression primitiveValue equals: 'test'
]
