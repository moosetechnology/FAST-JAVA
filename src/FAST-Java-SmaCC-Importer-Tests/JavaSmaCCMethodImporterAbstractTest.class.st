Class {
	#name : 'JavaSmaCCMethodImporterAbstractTest',
	#superclass : 'JavaSmaCCImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'testing' }
JavaSmaCCMethodImporterAbstractTest class >> isAbstract [

	^ self == JavaSmaCCMethodImporterAbstractTest
]

{ #category : 'running' }
JavaSmaCCMethodImporterAbstractTest >> javaMethod [
	self subclassResponsibility 
]

{ #category : 'running' }
JavaSmaCCMethodImporterAbstractTest >> setUp [

	super setUp.
	fastModel := (self parseMethodString: self javaMethod).
	fastMethod := fastModel allFASTJavaMethodEntity anyOne
]
