Class {
	#name : #JavaSmaCCArrayInitializationTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNewArray',
		'methodArrayInitialization'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCArrayInitializationTest >> methodArrayInitialization [
	^ 'void arrayAccess() {
   String[] hello = {"hello", "world"};
}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayInitializationTest >> setUp [
	super setUp.
	methodArrayInitialization := (self parseMethod: 'ArrayInitialization')
]

{ #category : #tests }
JavaSmaCCArrayInitializationTest >> testNumberOfInitializedElement [
	self assert: (methodArrayInitialization allWithType: FASTJavaArrayInitializer) first initializers size equals: 2
]
