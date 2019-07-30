Class {
	#name : #JavaSmaCCMethodModifiersTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodWithModifiers'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCMethodModifiersTest >> methodWithModifiers [
	 ^ '
	@Hello
	private transient void hello(){}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodModifiersTest >> setUp [
	super setUp.
	methodWithModifiers := (self parseMethod: 'WithModifiers')
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodModifiersTest >> testMethodAnnotationExpression [
	self assert: (methodWithModifiers allWithType: FASTJavaAnnotation) anyOne expression class equals: FASTVariableExpression
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodModifiersTest >> testMethodModifiersNumber [
	self assert: (methodWithModifiers allWithType: FASTJavaMethodEntity) anyOne modifiers size equals: 3
]
