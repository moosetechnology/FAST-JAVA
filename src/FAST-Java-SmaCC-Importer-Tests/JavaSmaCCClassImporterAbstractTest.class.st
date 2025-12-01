Class {
	#name : 'JavaSmaCCClassImporterAbstractTest',
	#superclass : 'JavaSmaCCImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCClassImporterAbstractTest >> javaClass [

	self shouldBeImplemented 
]

{ #category : 'running' }
JavaSmaCCClassImporterAbstractTest >> setUp [

	fastModel := self parseClassString: self javaClass
]
