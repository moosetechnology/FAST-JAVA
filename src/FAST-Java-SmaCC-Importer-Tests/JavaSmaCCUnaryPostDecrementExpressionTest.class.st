Class {
	#name : 'JavaSmaCCUnaryPostDecrementExpressionTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCUnaryPostDecrementExpressionTest >> javaMethod [
	^ 'public void patate() {
	i--;
}'
]

{ #category : 'tests' }
JavaSmaCCUnaryPostDecrementExpressionTest >> testUnaryExpressionIsPrefixed [

	self deny: fastMethod statements first containedEntities anyOne isPrefixedUnaryExpression
]

{ #category : 'tests' }
JavaSmaCCUnaryPostDecrementExpressionTest >> testUnaryExpressionOperator [

	self assert: fastMethod statements first containedEntities anyOne operator equals: '--'
]

{ #category : 'tests' }
JavaSmaCCUnaryPostDecrementExpressionTest >> testUnaryExpressionOperatorType [

	self assert: fastMethod statements first containedEntities anyOne operator class equals: ByteString
]

{ #category : 'tests' }
JavaSmaCCUnaryPostDecrementExpressionTest >> testUnaryExpressionType [

	self assert: fastMethod statements first containedEntities anyOne class equals: FASTJavaUnaryExpression
]
