Class {
	#name : #JavaSmaCCMethodJokerTypeTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodWithModifiers'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCMethodJokerTypeTest >> methodWithModifiers [
	 ^ 'private <T extends B & A & C> T hello(){}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodJokerTypeTest >> setUp [
	super setUp.
	methodWithModifiers := (self parseMethod: 'WithModifiers')
]

{ #category : #tests }
JavaSmaCCMethodJokerTypeTest >> testMethodJockerType [
	self assert: (methodWithModifiers allWithType: FASTJavaMethodEntity) anyOne typeParameters size equals: 1
]

{ #category : #tests }
JavaSmaCCMethodJokerTypeTest >> testMethodTypeParameterName [

	self
		assert:
			(methodWithModifiers allWithType: FASTJavaMethodEntity) anyOne
				typeParameters anyOne name
		equals: 'T'
]

{ #category : #tests }
JavaSmaCCMethodJokerTypeTest >> testMethodTypeParameterTypesNames [

	self
		assertCollection:
			(((methodWithModifiers allWithType: FASTJavaMethodEntity) anyOne
				typeParameters anyOne types) collect: [:t | t typeName name ])
		equals: { 'B' . 'A' . 'C' } asOrderedCollection
]

{ #category : #tests }
JavaSmaCCMethodJokerTypeTest >> testMethodTypeParameterTypesNumber [

	self
		assert:
			(methodWithModifiers allWithType: FASTJavaMethodEntity) anyOne
				typeParameters anyOne types size
		equals: 3
]
