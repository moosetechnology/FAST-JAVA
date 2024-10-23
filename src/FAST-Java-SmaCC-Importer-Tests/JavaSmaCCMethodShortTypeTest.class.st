Class {
	#name : 'JavaSmaCCMethodShortTypeTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'as yet unclassified' }
JavaSmaCCMethodShortTypeTest >> javaMethod [
	 ^ 'short hello(){}'
]

{ #category : 'tests' }
JavaSmaCCMethodShortTypeTest >> testMethodTypeType [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type class equals: FASTJavaShortTypeExpression
]
