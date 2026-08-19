Class {
	#name : 'JavaSmaCCStaticImportDeclarationTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCStaticImportDeclarationTest >> javaClass [
	^ 'import static fr.inria.fast.Hello;'
]

{ #category : 'tests' }
JavaSmaCCStaticImportDeclarationTest >> testImport [

	| import |
	self assert: (fastModel allWithType: FASTJavaImportDeclaration) size equals: 1.

	import := (fastModel allWithType: FASTJavaImportDeclaration) anyOne.

	self assert: import isStatic.
	self deny: import isOnDemand
]
