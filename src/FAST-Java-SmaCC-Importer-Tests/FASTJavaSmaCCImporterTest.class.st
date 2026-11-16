"
I test that the Java importer of FAST imports a second source into the model of a first one.

"
Class {
	#name : 'FASTJavaSmaCCImporterTest',
	#superclass : 'TestCase',
	#category : 'FAST-Java-SmaCC-Importer-Tests-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
FASTJavaSmaCCImporterTest >> testParseIntoAnExistingModelAddsTheSecondSource [

	| importer model |
	importer := FASTJavaSmaCCImporter new.
	model := importer parse: 'public class A { }' into: nil.
	self assert: (importer parse: 'public class B { }' into: model) identicalTo: model.
	self assert: (model allWithType: FASTJavaClassDeclaration) size equals: 2
]
