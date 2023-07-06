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
JavaSmaCCImportDeclaration >> setUp [

	fastModel := self parseClassString: self classString.
]

{ #category : #tests }
JavaSmaCCImportDeclaration >> testImport [

	self assert: (fastModel allWithType: FASTJavaImportDeclaration) size equals: 1.
	self assert: (fastModel allWithType: FASTJavaImportDeclaration) anyOne qualifiedName fullName equals: 'fr.inria.fast.Hello'.
]
