Class {
	#name : 'JavaSmaCCDeclarationTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCDeclarationTest >> javaMethod [
	
	^ 
'public Declaration(int parameter1, double parameter2){
}
'
]

{ #category : 'tests' }
JavaSmaCCDeclarationTest >> testNumberOfModifier [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne modifiers size equals: 1
]

{ #category : 'tests' }
JavaSmaCCDeclarationTest >> testNumberOfParameters [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne parameters size equals: 2
]
