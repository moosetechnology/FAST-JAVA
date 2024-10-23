Class {
	#name : 'JavaSmaCCLocalVariableStringInitNullTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCLocalVariableStringInitNullTest >> javaMethod [
	
	^ 'String aLittleOfVariables5() {
		String x = null;	
		return x;
	}'
]

{ #category : 'tests' }
JavaSmaCCLocalVariableStringInitNullTest >> testVariableDeclaratorExpressionType5 [
	self assert: fastMethod statementBlock statements first declarators first expression class equals: FASTJavaNullLiteral
]

{ #category : 'tests' }
JavaSmaCCLocalVariableStringInitNullTest >> testVariableDeclaratorExpressionValue5 [
	self assert: fastMethod statementBlock statements first declarators first expression primitiveValue equals: 'null'
]
