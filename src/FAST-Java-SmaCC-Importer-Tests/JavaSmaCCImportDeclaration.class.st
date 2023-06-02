Class {
	#name : #JavaSmaCCImportDeclaration,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCImportDeclaration >> classString [
	^ 'import fr.inria.fast.Hello;
class A {
}' 
]

{ #category : #tests }
JavaSmaCCImportDeclaration >> testImport [
	| model |
	model := self parseClassString: self classString.
	self assert: (model allWithType: FASTJavaImportDeclaration) size equals: 1.
	self assert: (model allWithType: FASTJavaImportDeclaration) anyOne qualifiedName fullName equals: 'fr.inria.fast.Hello'.
]
