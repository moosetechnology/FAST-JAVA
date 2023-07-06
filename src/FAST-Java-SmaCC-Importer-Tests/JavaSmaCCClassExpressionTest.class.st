Class {
	#name : #JavaSmaCCClassExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCClassExpressionTest >> testClassExpressionFieldName [
	self assert: fastMethod statements anyOne declarators anyOne expression fieldName equals: 'property' 
]

{ #category : #tests }
JavaSmaCCClassExpressionTest >> testClassExpressionParent [
	self assert: fastMethod statements anyOne declarators anyOne expression parentNode equals: fastMethod statements anyOne declarators anyOne 
]

{ #category : #tests }
JavaSmaCCClassExpressionTest >> testClassExpressionSize [
	self assert: (fastMethod mooseModel allWithType: FASTJavaClassProperty) size equals: 1 
]

{ #category : #tests }
JavaSmaCCClassExpressionTest >> testClassExpressionType [
	self assert: fastMethod statements anyOne declarators anyOne expression class equals: FASTJavaClassProperty 
]
