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

{ #category : #accessing }
JavaSmaCCMultiImportDeclaration >> javaMethod [
	^ self shouldBeImplemented
]

{ #category : #tests }
JavaSmaCCMultiImportDeclaration >> setUp [

	fastModel := self parseClassString: self classString
]

{ #category : #tests }
JavaSmaCCMultiImportDeclaration >> testImport [

	self assert: (fastModel allWithType: FASTJavaImportDeclaration) size equals: 1.
]
