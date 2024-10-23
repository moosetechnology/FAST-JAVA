Class {
	#name : 'JavaSmaCCMethodJokerTypeTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'as yet unclassified' }
JavaSmaCCMethodJokerTypeTest >> javaMethod [
	 ^ 'private <T extends B & A & C> T hello(){}'
]

{ #category : 'tests' }
JavaSmaCCMethodJokerTypeTest >> testMethodJockerType [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne typeParameters size equals: 1
]

{ #category : 'tests' }
JavaSmaCCMethodJokerTypeTest >> testMethodTypeParameterName [

	self
		assert:
			(fastModel allWithType: FASTJavaMethodEntity) anyOne
				typeParameters anyOne name
		equals: 'T'
]

{ #category : 'tests' }
JavaSmaCCMethodJokerTypeTest >> testMethodTypeParameterTypesNames [

	self
		assertCollection:
			(((fastModel allWithType: FASTJavaMethodEntity) anyOne
				typeParameters anyOne types) collect: [:t | t typeName name ])
		equals: { 'B' . 'A' . 'C' } asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCMethodJokerTypeTest >> testMethodTypeParameterTypesNumber [

	self
		assert:
			(fastModel allWithType: FASTJavaMethodEntity) anyOne
				typeParameters anyOne types size
		equals: 3
]
