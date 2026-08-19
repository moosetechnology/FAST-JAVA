Class {
	#name : 'JavaSmaCCDeclarationTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCDeclarationTest >> javaMethod [
	^ 'public Declaration(int parameter1, double parameter2){}'
]

{ #category : 'tests' }
JavaSmaCCDeclarationTest >> testNumberOfModifier [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne modifiers size equals: 1
]

{ #category : 'tests' }
JavaSmaCCDeclarationTest >> testNumberOfParameters [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne parameters size equals: 2
]
