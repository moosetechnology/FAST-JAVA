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

{ #category : 'resources' }
JavaSmaCCImporterAbstractTest >> writtenModifiersOf: aFASTJavaEntity [
	"JLS 8.1.1: a declaration writes its keywords and its annotations in one list. The model
	holds them apart, and the positions they carry give back the run the source writes."

	^ aFASTJavaEntity annotations asArray , aFASTJavaEntity modifiers asArray sorted: [ :a :b | a startPos <= b startPos ]
]
