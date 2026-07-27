Class {
	#name : 'JavaSmaCCCommentsAbstractTest',
	#superclass : 'JavaSmaCCImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'testing' }
JavaSmaCCCommentsAbstractTest class >> isAbstract [

	^ self == JavaSmaCCCommentsAbstractTest
]

{ #category : 'parsing' }
JavaSmaCCCommentsAbstractTest >> parseMethodString: aString [
	"overriding to add comments to the parser"

	^ JavaSmaCCProgramNodeImporterVisitor new 
		withComments ;
		parseCodeMethodString: aString
]

{ #category : 'running' }
JavaSmaCCCommentsAbstractTest >> setUp [

	super setUp.
	fastModel := (self parseMethodString: self javaMethod).
	fastMethod := fastModel allFASTJavaMethodEntity anyOne
]
