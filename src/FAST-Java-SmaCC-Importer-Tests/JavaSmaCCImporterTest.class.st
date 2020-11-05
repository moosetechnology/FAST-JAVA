Class {
	#name : #JavaSmaCCImporterTest,
	#superclass : #TestCase,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCImporterTest >> parseClassString: aString [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeString: aString
]

{ #category : #running }
JavaSmaCCImporterTest >> parseMethod: methodName [
	^ self
		parseMethodString: (self perform: (#method , methodName capitalized) asSymbol)
]

{ #category : #running }
JavaSmaCCImporterTest >> parseMethodString: aString [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString: aString
]
