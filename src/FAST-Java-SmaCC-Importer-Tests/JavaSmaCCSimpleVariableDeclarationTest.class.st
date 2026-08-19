Class {
	#name : 'JavaSmaCCSimpleVariableDeclarationTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCSimpleVariableDeclarationTest >> javaMethod [
	^ 'void forMethod() {
	int x;
}'
]

{ #category : 'tests' }
JavaSmaCCSimpleVariableDeclarationTest >> testVariableDeclaratorExpressionName [
	self
		assert: fastMethod statements first declarators first variable name
		equals: 'x'
]
