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
	 ^ 'private transient void hello(){}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodModifiersTest >> setUp [
	super setUp.
	methodWithModifiers := (self parseMethod: 'WithModifiers')
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodModifiersTest >> testMethodModifiersNumber [
	self assert: (methodWithModifiers allWithType: FASTJavaMethodEntity) anyOne modifiers size equals: 2
]
