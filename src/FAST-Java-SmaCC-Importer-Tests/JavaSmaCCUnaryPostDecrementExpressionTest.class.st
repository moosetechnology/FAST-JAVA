Class {
	#name : 'JavaSmaCCUnaryPostDecrementExpressionTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCUnaryPostDecrementExpressionTest >> javaMethod [
	^ 'public void patate () {
	i--;		
}'
]

{ #category : 'tests' }
JavaSmaCCUnaryPostDecrementExpressionTest >> testUnaryExpressionIsPrefixed [
	self deny: fastMethod statements first children anyOne isPrefixedUnaryExpression
]

{ #category : 'tests' }
JavaSmaCCUnaryPostDecrementExpressionTest >> testUnaryExpressionOperator [
	self assert: fastMethod statements first children anyOne operator equals: '--'
]

{ #category : 'tests' }
JavaSmaCCUnaryPostDecrementExpressionTest >> testUnaryExpressionOperatorType [
	self assert: fastMethod statements first children anyOne operator class equals: ByteString
]

{ #category : 'tests' }
JavaSmaCCUnaryPostDecrementExpressionTest >> testUnaryExpressionType [
	self assert: fastMethod statements first children anyOne class equals: FASTJavaUnaryExpression
]
