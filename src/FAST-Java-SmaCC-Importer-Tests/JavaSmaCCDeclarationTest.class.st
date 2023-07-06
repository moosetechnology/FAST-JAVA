Class {
	#name : #JavaSmaCCDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCDeclarationTest >> testNumberOfModifier [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne modifiers size equals: 1
]

{ #category : #tests }
JavaSmaCCDeclarationTest >> testNumberOfParameters [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne parameters size equals: 2
]
