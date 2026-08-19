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

	self assert: (fastModel allWithType: FASTJavaImportDeclaration) size equals: 1.
	self assert: (fastModel allWithType: FASTJavaImportDeclaration) anyOne isOnDemand
]
