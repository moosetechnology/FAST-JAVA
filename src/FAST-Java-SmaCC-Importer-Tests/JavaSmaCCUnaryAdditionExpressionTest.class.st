Class {
	#name : 'JavaSmaCCUnaryAdditionExpressionTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCUnaryAdditionExpressionTest >> javaMethod [
	^ 'public void patate () {
	int i = +i;	
}'
]

{ #category : 'tests' }
JavaSmaCCUnaryAdditionExpressionTest >> testUnaryExpressionIsPrefixed [
	self
		assert: fastMethod statements first declarators first expression isPrefixedUnaryExpression
]

{ #category : 'tests' }
JavaSmaCCUnaryAdditionExpressionTest >> testUnaryExpressionOperator [
	self
		assert: fastMethod statements first declarators first expression operator
		equals: '+'
]

{ #category : 'tests' }
JavaSmaCCUnaryAdditionExpressionTest >> testUnaryExpressionOperatorType [
	self
		assert: fastMethod statements first declarators first expression operator class
		equals: ByteString
]

{ #category : 'tests' }
JavaSmaCCUnaryAdditionExpressionTest >> testUnaryExpressionType [
	self
		assert: fastMethod statements first declarators first expression class
		equals: FASTJavaUnaryExpression
]
