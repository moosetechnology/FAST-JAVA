Class {
	#name : #JavaSmaCCSimpleVariablesDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCSimpleVariablesDeclarationTest >> javaMethod [
	^ 'void forMethod() {
	int x, y;
}'
]

{ #category : #tests }
JavaSmaCCSimpleVariablesDeclarationTest >> testVariableDeclaratorExpressionName [
	self
		assert: fastMethod statements first declarators first variable name
		equals: 'x'.
	self
		assert: fastMethod statements first declarators second variable name
		equals: 'y'
]
