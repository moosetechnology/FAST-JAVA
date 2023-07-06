Class {
	#name : #JavaSmaCCEmptyMethodDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCEmptyMethodDeclarationTest >> testEmptyDeclaredMethodSize [
	self assert: (fastModel allWithType: FASTJavaEmptyMethodDeclaration) size equals: 1
]
