Class {
	#name : 'JavaSmaCCUnaryPreIncrementExpressionTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCUnaryPreIncrementExpressionTest >> javaMethod [
	^ 'public void patate() {
	++i;
}'
]

{ #category : 'tests' }
JavaSmaCCUnaryPreIncrementExpressionTest >> testUnaryExpressionIsPrefixed [

	self assert: fastMethod statements first containedEntities anyOne isPrefixedUnaryExpression
]

{ #category : 'tests' }
JavaSmaCCUnaryPreIncrementExpressionTest >> testUnaryExpressionOperator [

	self assert: fastMethod statements first containedEntities anyOne operator equals: '++'
]

{ #category : 'tests' }
JavaSmaCCUnaryPreIncrementExpressionTest >> testUnaryExpressionType [

	self assert: fastMethod statements first containedEntities anyOne class equals: FASTJavaUnaryExpression
]
