Class {
	#name : 'JavaSmaCCMethodLowerBoundedWildCardParameterTypeTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCMethodLowerBoundedWildCardParameterTypeTest >> javaMethod [

	^ 'public Collection<? super Number> hello(){}'
]

{ #category : 'tests' }
JavaSmaCCMethodLowerBoundedWildCardParameterTypeTest >> testMethodTypeParameterKeepsNoUpperBound [

	self assertEmpty: (fastModel allWithType: FASTJavaMethodEntity) anyOne type arguments anyOne types
]

{ #category : 'tests' }
JavaSmaCCMethodLowerBoundedWildCardParameterTypeTest >> testMethodTypeParameterName [

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type arguments anyOne name equals: '?'
]

{ #category : 'tests' }
JavaSmaCCMethodLowerBoundedWildCardParameterTypeTest >> testMethodTypeParameterSuperTypeName [

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type arguments anyOne superType typeName name equals: 'Number'
]
