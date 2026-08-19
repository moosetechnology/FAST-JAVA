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

	self assert: (fastModel allWithType: FASTJavaImportDeclaration) size equals: 1.
	self assert: (fastModel allWithType: FASTJavaImportDeclaration) anyOne qualifiedName fullName equals: 'fr.inria.fast.Hello'
]
