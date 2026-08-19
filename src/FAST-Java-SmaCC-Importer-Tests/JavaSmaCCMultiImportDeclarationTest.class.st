Class {
	#name : 'JavaSmaCCMultiImportDeclarationTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMultiImportDeclarationTest >> javaClass [
	^ 'import fr.inria.fast.*;'
]

{ #category : 'tests' }
JavaSmaCCMultiImportDeclarationTest >> testImport [

	| import |
	self assert: (fastModel allWithType: FASTJavaImportDeclaration) size equals: 1.

	import := (fastModel allWithType: FASTJavaImportDeclaration) anyOne.

	self deny: import isStatic.
	self assert: import isOnDemand
]
