Class {
	#name : 'JavaSmaCCUnarySubstractionExpressionTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCUnarySubstractionExpressionTest >> javaMethod [
	^ 'public void patate () {
	int i = -i;	
}'
]

{ #category : 'tests' }
JavaSmaCCUnarySubstractionExpressionTest >> testUnaryExpressionIsPrefixed [
	self
		assert: fastMethod statements first declarators first expression isPrefixedUnaryExpression
]

{ #category : 'tests' }
JavaSmaCCUnarySubstractionExpressionTest >> testUnaryExpressionOperator [
	self
		assert: fastMethod statements first declarators first expression operator
		equals: '-'
]

{ #category : 'tests' }
JavaSmaCCUnarySubstractionExpressionTest >> testUnaryExpressionOperatorType [
	self
		assert: fastMethod statements first declarators first expression operator class
		equals: ByteString
]

{ #category : 'tests' }
JavaSmaCCUnarySubstractionExpressionTest >> testUnaryExpressionType [
	self
		assert: fastMethod statements first declarators first expression class
		equals: FASTJavaUnaryExpression
]
