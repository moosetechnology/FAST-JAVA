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
	 ^ 'private <T extends String> T hello(){}'
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
