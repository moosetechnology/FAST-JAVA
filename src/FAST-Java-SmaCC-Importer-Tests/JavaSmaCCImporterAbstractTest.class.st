Class {
	#name : 'JavaSmaCCImporterAbstractTest',
	#superclass : 'TestCase',
	#instVars : [
		'fastModel',
		'fastMethod'
	],
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'testing' }
JavaSmaCCImporterAbstractTest class >> isAbstract [

	^ self == JavaSmaCCImporterAbstractTest
]

{ #category : 'running' }
JavaSmaCCImporterAbstractTest >> parseClassString: aString [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeString: aString
]

{ #category : 'running' }
JavaSmaCCImporterAbstractTest >> parseMethodString: aString [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString: aString
]
