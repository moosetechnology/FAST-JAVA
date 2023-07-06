Class {
	#name : #JavaSmaCCUnaryNotExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCUnaryNotExpressionTest >> testUnaryExpressionIsPrefixed [
	self assert: fastMethod statements first declarators first expression isPrefixedUnaryExpression
]

{ #category : #tests }
JavaSmaCCUnaryNotExpressionTest >> testUnaryExpressionOperator [
	self
		assert: fastMethod statements first declarators first expression operator
		equals: '!'
]

{ #category : #tests }
JavaSmaCCUnaryNotExpressionTest >> testUnaryExpressionOperatorType [
	self
		assert: fastMethod statements first declarators first expression operator class
		equals: ByteString
]

{ #category : #tests }
JavaSmaCCUnaryNotExpressionTest >> testUnaryExpressionType [
	self
		assert: fastMethod statements first declarators first expression class
		equals: FASTJavaUnaryExpression
]
