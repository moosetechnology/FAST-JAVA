Class {
	#name : 'JavaSmaCCMethodBoundedWildCardParameterTypeTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCMethodBoundedWildCardParameterTypeTest >> javaMethod [

	^ 'public Collection<? extends Number> hello(){}'
]

{ #category : 'tests' }
JavaSmaCCMethodBoundedWildCardParameterTypeTest >> testMethodArrayBoundIsNotKept [

	| fastModelWithArrayBound |
	fastModelWithArrayBound := self parseMethodString: 'public Class<? extends Number[]> hello(){}'.

	self assertEmpty: (fastModelWithArrayBound allWithType: FASTJavaMethodEntity) anyOne type arguments anyOne types
]

{ #category : 'tests' }
JavaSmaCCMethodBoundedWildCardParameterTypeTest >> testMethodTypeParameterBoundName [

	self
		assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type arguments anyOne types anyOne typeName name
		equals: 'Number'
]

{ #category : 'tests' }
JavaSmaCCMethodBoundedWildCardParameterTypeTest >> testMethodTypeParameterBoundsNumber [

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type arguments anyOne types size equals: 1
]

{ #category : 'tests' }
JavaSmaCCMethodBoundedWildCardParameterTypeTest >> testMethodTypeParameterName [

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type arguments anyOne name equals: '?'
]
