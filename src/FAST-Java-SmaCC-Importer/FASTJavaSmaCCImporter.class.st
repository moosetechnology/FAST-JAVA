"
I import the source of a Java file into a FAST Java model, with the FASTTImporter API. I use the SmaCC parser through JavaSmaCCProgramNodeImporterVisitor.

"
Class {
	#name : 'FASTJavaSmaCCImporter',
	#superclass : 'Object',
	#traits : 'FASTTImporter',
	#classTraits : 'FASTTImporter classTrait',
	#category : 'FAST-Java-SmaCC-Importer-Importer',
	#package : 'FAST-Java-SmaCC-Importer',
	#tag : 'Importer'
}

{ #category : 'accessing' }
FASTJavaSmaCCImporter class >> extensions [
	"File extensions without the dot that the importer handles"

	^ #( 'java' )
]

{ #category : 'importing' }
FASTJavaSmaCCImporter >> parse: aString into: aModel [
	"Import the Java source in the model given, or in a new model when it is nil, and answer the model"

	| visitor |
	visitor := JavaSmaCCProgramNodeImporterVisitor new.
	aModel ifNotNil: [ visitor model: aModel ].
	^ visitor parseCodeString: aString
]
