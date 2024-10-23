Class {
	#name : 'JavaSmaCCPackageDeclaration',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'tests' }
JavaSmaCCPackageDeclaration >> classString [
	^ 'package fr.inria.fast;
class A {
}' 
]

{ #category : 'tests' }
JavaSmaCCPackageDeclaration >> setUp [

	fastModel := self parseClassString: self classString
]

{ #category : 'tests' }
JavaSmaCCPackageDeclaration >> testImportPackage [

	self assert: (fastModel allWithType: FASTJavaPackageDeclaration) size equals: 1.
	self assert: (fastModel allWithType: FASTJavaPackageDeclaration) anyOne qualifiedName fullName equals: 'fr.inria.fast'.
]
