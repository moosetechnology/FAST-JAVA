Class {
	#name : 'JavaSmaCCClassImporterAbstractTest',
	#superclass : 'JavaSmaCCImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'testing' }
JavaSmaCCClassImporterAbstractTest class >> isAbstract [

	^ self == JavaSmaCCClassImporterAbstractTest
]

{ #category : 'running' }
JavaSmaCCClassImporterAbstractTest >> javaClass [

	self shouldBeImplemented 
]

{ #category : 'running' }
JavaSmaCCClassImporterAbstractTest >> setUp [

	fastModel := self parseClassString: self javaClass
]
