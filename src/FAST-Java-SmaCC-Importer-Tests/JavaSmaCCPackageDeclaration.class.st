Class {
	#name : #JavaSmaCCPackageDeclaration,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCPackageDeclaration >> classString [
	^ 'package fr.inria.fast;
class A {
}' 
]

{ #category : #tests }
JavaSmaCCPackageDeclaration >> testImportPackage [
	| model |
	model := self parseClassString: self classString.
	self assert: (model allWithType: FASTJavaPackageDeclaration) size equals: 1.
	self assert: (model allWithType: FASTJavaPackageDeclaration) anyOne declarationName fullName equals: 'fr.inria.fast'.
]
