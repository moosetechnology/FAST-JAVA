Class {
	#name : #JavaSmaCCParameterizedTypeTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCParameterizedTypeTest >> javaMethod [
	^'IMap<String,Iterator<String>> meth() { }'
]

{ #category : #tests }
JavaSmaCCParameterizedTypeTest >> testMethodTypeName [

	self
		assert:
			(fastModel allWithType: FASTJavaMethodEntity) anyOne type typeName name
		equals: 'IMap'
]

{ #category : #tests }
JavaSmaCCParameterizedTypeTest >> testMethodTypeParametersNames [

	self
		assert:
			(fastModel allWithType: FASTJavaMethodEntity) anyOne type arguments first typeName name
		equals: 'String'.
	
	self
		assert:
			(fastModel allWithType: FASTJavaMethodEntity) anyOne type arguments second typeName name
		equals: 'Iterator'.
]

{ #category : #tests }
JavaSmaCCParameterizedTypeTest >> testMethodTypeParametersNumber [

	self
		assert:
			(fastModel allWithType: FASTJavaMethodEntity) anyOne type arguments size
		equals: 2
]

{ #category : #tests }
JavaSmaCCParameterizedTypeTest >> testMethodTypeParametersTypes [

	self
		assert:
			(fastModel allWithType: FASTJavaMethodEntity) anyOne type arguments first class
		equals: FASTJavaClassTypeExpression.
	
	self
		assert:
			(fastModel allWithType: FASTJavaMethodEntity) anyOne type arguments second class
		equals: FASTJavaClassTypeExpression.
]

{ #category : #tests }
JavaSmaCCParameterizedTypeTest >> testMethodTypeType [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type class equals: FASTJavaClassTypeExpression
]
