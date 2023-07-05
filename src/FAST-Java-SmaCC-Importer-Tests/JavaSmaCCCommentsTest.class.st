Class {
	#name : #JavaSmaCCCommentsTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'fastModel'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #parsing }
JavaSmaCCCommentsTest >> parseMethodString: aString [
	"overriding to add comments to the parser"
	^ JavaSmaCCProgramNodeImporterVisitor new 
		withComments ;
		parseCodeMethodString: aString
]
