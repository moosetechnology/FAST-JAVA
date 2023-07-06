Class {
	#name : #JavaSmaCCSimpleVariableDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCSimpleVariableDeclarationTest >> testVariableDeclaratorExpressionName [
	self
		assert: fastMethod statements first declarators first variable name
		equals: 'x'
]
