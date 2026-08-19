Class {
	#name : 'JavaSmaCCUnaryPostIncrementExpressionTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCUnaryPostIncrementExpressionTest >> javaMethod [
	^ 'public void patate() {
	i++;
}'
]

{ #category : 'tests' }
JavaSmaCCUnaryPostIncrementExpressionTest >> testUnaryExpressionIsPrefixed [

	self deny: fastMethod statements first containedEntities anyOne isPrefixedUnaryExpression
]

{ #category : 'tests' }
JavaSmaCCUnaryPostIncrementExpressionTest >> testUnaryExpressionOperator [

	self assert: fastMethod statements first containedEntities anyOne operator equals: '++'
]

{ #category : 'tests' }
JavaSmaCCUnaryPostIncrementExpressionTest >> testUnaryExpressionOperatorType [

	self assert: fastMethod statements first containedEntities anyOne operator class equals: ByteString
]

{ #category : 'tests' }
JavaSmaCCUnaryPostIncrementExpressionTest >> testUnaryExpressionType [

	self assert: fastMethod statements first containedEntities anyOne class equals: FASTJavaUnaryExpression
]
