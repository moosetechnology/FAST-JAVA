Class {
	#name : 'JavaSmaCCStaticMultiImportDeclarationTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCStaticMultiImportDeclarationTest >> javaClass [

	^ 'import static fr.inria.fast.Hello.*;'
]

{ #category : 'tests' }
JavaSmaCCStaticMultiImportDeclarationTest >> testImport [

	| import |
	self assert: (fastModel allWithType: FASTJavaImportDeclaration) size equals: 1.

	import := (fastModel allWithType: FASTJavaImportDeclaration) anyOne.

	self assert: import qualifiedName fullName equals: 'fr.inria.fast.Hello'.
	self assert: import isStatic.
	self assert: import isOnDemand
]
