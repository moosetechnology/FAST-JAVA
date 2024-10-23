Class {
	#name : 'JavaSmaCCUnaryBitInvertExpressionTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCUnaryBitInvertExpressionTest >> javaMethod [
	^ 'public void patate () {
	int i = ~i;	
}'
]

{ #category : 'tests' }
JavaSmaCCUnaryBitInvertExpressionTest >> testUnaryExpressionIsPrefixed [
	self
		assert: fastMethod statements first declarators first expression isPrefixedUnaryExpression
]

{ #category : 'tests' }
JavaSmaCCUnaryBitInvertExpressionTest >> testUnaryExpressionOperator [
	self
		assert: fastMethod statements first declarators first expression operator
		equals: '~'
]

{ #category : 'tests' }
JavaSmaCCUnaryBitInvertExpressionTest >> testUnaryExpressionOperatorType [
	self
		assert: fastMethod statements first declarators first expression operator class
		equals: ByteString
]

{ #category : 'tests' }
JavaSmaCCUnaryBitInvertExpressionTest >> testUnaryExpressionType [
	self
		assert: fastMethod statements first declarators first expression class
		equals: FASTJavaUnaryExpression
]
