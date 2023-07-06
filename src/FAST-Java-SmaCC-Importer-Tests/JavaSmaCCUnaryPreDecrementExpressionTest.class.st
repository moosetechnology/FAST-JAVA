Class {
	#name : #JavaSmaCCUnaryPreDecrementExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCUnaryPreDecrementExpressionTest >> javaMethod [
	^ 'public void patate () {
	--i;		
}'
]

{ #category : #tests }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionIsPrefixed [
	self assert: fastMethod statements first children anyOne isPrefixedUnaryExpression
]

{ #category : #tests }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionOperator [
	self assert: fastMethod statements first children anyOne operator equals: '--'
]

{ #category : #tests }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionOperatorType [
	self assert: fastMethod statements first children anyOne operator class equals: ByteString
]

{ #category : #tests }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionType [
	self assert: fastMethod statements first children anyOne class equals: FASTJavaUnaryExpression
]
