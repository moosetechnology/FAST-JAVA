Class {
	#name : 'JavaSmaCCImportDeclarationTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCImportDeclarationTest >> javaClass [
	^ 'import fr.inria.fast.Hello;'
]

{ #category : 'tests' }
JavaSmaCCImportDeclarationTest >> testImport [

	| import |
	self assert: (fastModel allWithType: FASTJavaImportDeclaration) size equals: 1.

	import := (fastModel allWithType: FASTJavaImportDeclaration) anyOne.

	self assert: import qualifiedName fullName equals: 'fr.inria.fast.Hello'.
	self deny: import isStatic.
	self deny: import isOnDemand
]
