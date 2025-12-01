Class {
	#name : 'JavaSmaCCMultiImportDeclaration',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'tests' }
JavaSmaCCMultiImportDeclaration >> javaClass [
	^ 'import fr.inria.fast.*;
class A {
}' 
]

{ #category : 'accessing' }
JavaSmaCCMultiImportDeclaration >> javaMethod [
	^ self shouldBeImplemented
]

{ #category : 'tests' }
JavaSmaCCMultiImportDeclaration >> testImport [

	self assert: (fastModel allWithType: FASTJavaImportDeclaration) size equals: 1.
]
