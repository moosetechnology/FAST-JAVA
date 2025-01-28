Class {
	#name : 'JavaSmaCCAnnotationWithInfixElementTest',
	#superclass : 'JavaSmaCCImporterTest',
	#instVars : [
		'methodNewArray'
	],
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCAnnotationWithInfixElementTest >> javaMethod [
	^ '@Useless( {"hello"+ "world"} )
	void concatenation() {
}'
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithInfixElementTest >> testElementsType [
	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements anyOne class
		equals: FASTJavaArrayAnnotationElement 
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithInfixElementTest >> testNumberOfElementsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements size equals: 1
]
