Class {
	#name : #JavaSmaCCSimpleVariableDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCSimpleVariableDeclarationTest >> javaMethod [
	^ 'void forMethod() {
	int x;
}'
]

{ #category : #tests }
JavaSmaCCSimpleVariableDeclarationTest >> testVariableDeclaratorExpressionName [
	self
		assert: fastMethod statements first declarators first variable name
		equals: 'x'
]
