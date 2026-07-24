Class {
	#name : 'JavaSmaCCUnaryPreDecrementExpressionTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCUnaryPreDecrementExpressionTest >> javaMethod [
	^ 'public void patate () {
	--i;		
}'
]

{ #category : 'tests' }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionIsPrefixed [

	self assert: fastMethod statements first containedEntities anyOne isPrefixedUnaryExpression
]

{ #category : 'tests' }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionOperator [

	self assert: fastMethod statements first containedEntities anyOne operator equals: '--'
]

{ #category : 'tests' }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionOperatorType [

	self assert: fastMethod statements first containedEntities anyOne operator class equals: ByteString
]

{ #category : 'tests' }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionType [

	self assert: fastMethod statements first containedEntities anyOne class equals: FASTJavaUnaryExpression
]
