Class {
	#name : #JavaSmaCCDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'declaration'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCDeclarationTest >> methodDeclaration [
	
	^ 
'public Declaration(int parameter1, double parameter2){
}
'
]

{ #category : #running }
JavaSmaCCDeclarationTest >> setUp [
	super setUp.
	declaration := (self parseMethod: 'Declaration')
]

{ #category : #tests }
JavaSmaCCDeclarationTest >> testNumberOfModifier [
	self assert: (declaration allWithType: FASTJavaMethodEntity) anyOne modifiers size equals: 1
]

{ #category : #tests }
JavaSmaCCDeclarationTest >> testNumberOfParameters [
	self assert: (declaration allWithType: FASTJavaMethodEntity) anyOne parameters size equals: 2
]
