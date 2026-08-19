Class {
	#name : 'JavaSmaCCMethodShortTypeTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMethodShortTypeTest >> javaMethod [
	^ 'short hello(){}'
]

{ #category : 'tests' }
JavaSmaCCMethodShortTypeTest >> testMethodTypeType [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type class equals: FASTJavaShortTypeExpression
]
