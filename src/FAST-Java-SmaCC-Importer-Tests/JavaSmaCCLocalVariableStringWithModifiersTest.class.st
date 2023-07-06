Class {
	#name : #JavaSmaCCLocalVariableStringWithModifiersTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCLocalVariableStringWithModifiersTest >> testVariableDeclaratorExpressionType5 [
	self assert: fastMethod statementBlock statements first declarators first expression class equals: FASTJavaNullLiteral
]

{ #category : #tests }
JavaSmaCCLocalVariableStringWithModifiersTest >> testVariableDeclaratorExpressionValue5 [
	self assert: fastMethod statementBlock statements first declarators first expression primitiveValue equals: 'null'
]
