Class {
	#name : #JavaSmaCCArrayInitializationTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNewArray'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCArrayInitializationTest >> testNumberOfInitializedElement [
	self assert: (fastModel allWithType: FASTJavaArrayInitializer) first initializers size equals: 2
]
