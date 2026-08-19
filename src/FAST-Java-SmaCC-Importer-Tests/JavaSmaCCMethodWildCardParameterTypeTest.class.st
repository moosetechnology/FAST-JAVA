Class {
	#name : 'JavaSmaCCMethodWildCardParameterTypeTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMethodWildCardParameterTypeTest >> javaMethod [
	^ 'public Collection<?> hello(){}'
]

{ #category : 'tests' }
JavaSmaCCMethodWildCardParameterTypeTest >> testMethodTypeClass [

	self
		assert:
			(fastModel allWithType: FASTJavaMethodEntity) anyOne
				type class
		equals: FASTJavaClassTypeExpression
]

{ #category : 'tests' }
JavaSmaCCMethodWildCardParameterTypeTest >> testMethodTypeName [

	self
		assert:
			(fastModel allWithType: FASTJavaMethodEntity) anyOne
				type typeName name
		equals: 'Collection'
]

{ #category : 'tests' }
JavaSmaCCMethodWildCardParameterTypeTest >> testMethodTypeParameterName [

	self
		assert:
			(fastModel allWithType: FASTJavaMethodEntity) anyOne
				type arguments anyOne name
		equals: '?'
]

{ #category : 'tests' }
JavaSmaCCMethodWildCardParameterTypeTest >> testMethodTypeParametersNumber [

	self
		assert:
			(fastModel allWithType: FASTJavaMethodEntity) anyOne
				type arguments size
		equals: 1
]
