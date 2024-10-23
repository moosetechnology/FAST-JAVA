Class {
	#name : 'JavaSmaCCLocalVariableStringWithModifiersTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCLocalVariableStringWithModifiersTest >> javaMethod [
	
	^ 'String aLittleOfVariables5() {
		final String x = null;	
		return x;
	}'
]

{ #category : 'tests' }
JavaSmaCCLocalVariableStringWithModifiersTest >> testVariableDeclaratorHasModifier [
	self assert: (fastModel allWithType: FASTJavaVarDeclStatement) anyOne modifiers size equals: 1.
	self assert: (fastModel allWithType: FASTJavaVarDeclStatement) anyOne modifiers anyOne class equals: FASTJavaModifier.
	self assert: (fastModel allWithType: FASTJavaVarDeclStatement) anyOne modifiers anyOne token equals: 'final'.

]
