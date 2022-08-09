Class {
	#name : #JavaSmaCCMultiImportDeclaration,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCMultiImportDeclaration >> classString [
	^ 'import fr.inria.fast.*;
class A {
}' 
]

{ #category : #tests }
JavaSmaCCMultiImportDeclaration >> testImport [
	| model |
	model := self parseClassString: self classString.
	self assert: (model allWithType: FASTJavaMultiImportDeclaration) size equals: 1.
]
