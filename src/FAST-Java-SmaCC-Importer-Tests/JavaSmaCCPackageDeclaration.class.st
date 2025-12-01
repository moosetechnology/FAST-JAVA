Class {
	#name : 'JavaSmaCCPackageDeclaration',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'tests' }
JavaSmaCCPackageDeclaration >> javaClass [
	^ 'package fr.inria.fast;
class A {
}' 
]

{ #category : 'tests' }
JavaSmaCCPackageDeclaration >> testImportPackage [

	self assert: (fastModel allWithType: FASTJavaPackageDeclaration) size equals: 1.
	self assert: (fastModel allWithType: FASTJavaPackageDeclaration) anyOne qualifiedName fullName equals: 'fr.inria.fast'.
]
