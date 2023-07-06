Class {
	#name : #JavaSmaCCLocalVariableStringWithModifiersTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCLocalVariableStringWithModifiersTest >> javaMethod [
	
	^ 'String aLittleOfVariables5() {
		String x = null;	
		return x;
	}'
]

{ #category : #tests }
JavaSmaCCLocalVariableStringWithModifiersTest >> testVariableDeclaratorExpressionType5 [
	self assert: fastMethod statementBlock statements first declarators first expression class equals: FASTJavaNullLiteral
]

{ #category : #tests }
JavaSmaCCLocalVariableStringWithModifiersTest >> testVariableDeclaratorExpressionValue5 [
	self assert: fastMethod statementBlock statements first declarators first expression primitiveValue equals: 'null'
]
