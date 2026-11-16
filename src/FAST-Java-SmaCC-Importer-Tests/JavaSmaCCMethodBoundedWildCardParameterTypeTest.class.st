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
JavaSmaCCMethodBoundedWildCardParameterTypeTest >> testMethodArrayBoundIsKept [
	"JLS 4.5.1: the bound of a wildcard is a reference type, which an array type is as much
	as a class is."

	| fastModelWithArrayBound bound |
	fastModelWithArrayBound := self parseMethodString: 'public Class<? extends Number[]> hello(){}'.

	bound := (fastModelWithArrayBound allWithType: FASTJavaMethodEntity) anyOne type arguments anyOne types anyOne.
	self assert: bound class equals: FASTJavaArrayTypeExpression.
	self assert: bound baseType name equals: 'Number'
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
