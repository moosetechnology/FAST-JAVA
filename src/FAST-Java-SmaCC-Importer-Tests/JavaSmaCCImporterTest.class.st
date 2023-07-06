Class {
	#name : #JavaSmaCCImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'fastModel',
		'fastMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCImporterTest >> javaMethod [
	self subclassResponsibility 
]

{ #category : #running }
JavaSmaCCImporterTest >> parseClassString: aString [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeString: aString
]

{ #category : #running }
JavaSmaCCImporterTest >> parseMethodString: aString [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString: aString
]

{ #category : #running }
JavaSmaCCImporterTest >> setUp [

	super setUp.
	fastModel := (self parseMethodString: self javaMethod).
	fastMethod := fastModel allFASTJavaMethodEntity anyOne
]
