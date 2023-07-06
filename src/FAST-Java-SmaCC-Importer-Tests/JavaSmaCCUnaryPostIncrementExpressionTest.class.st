Class {
	#name : #JavaSmaCCUnaryPostIncrementExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCUnaryPostIncrementExpressionTest >> javaMethod [
	^ 'public void patate () {
	i++;		
}'
]

{ #category : #tests }
JavaSmaCCUnaryPostIncrementExpressionTest >> testUnaryExpressionIsPrefixed [
	self deny: fastMethod statements first children anyOne isPrefixedUnaryExpression
]

{ #category : #tests }
JavaSmaCCUnaryPostIncrementExpressionTest >> testUnaryExpressionOperator [
	self assert: fastMethod statements first children anyOne operator equals: '++'
]

{ #category : #tests }
JavaSmaCCUnaryPostIncrementExpressionTest >> testUnaryExpressionOperatorType [
	self assert: fastMethod statements first children anyOne operator class equals: ByteString
]

{ #category : #tests }
JavaSmaCCUnaryPostIncrementExpressionTest >> testUnaryExpressionType [
	self assert: fastMethod statements first children anyOne class equals: FASTJavaUnaryExpression
]
