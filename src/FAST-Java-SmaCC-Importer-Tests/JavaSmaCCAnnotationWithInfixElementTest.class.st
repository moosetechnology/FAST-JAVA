Class {
	#name : 'JavaSmaCCAnnotationWithInfixElementTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCAnnotationWithInfixElementTest >> javaMethod [
	^ '@Useless( "hello" + "world" )
	void concatenation() {}'
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithInfixElementTest >> testElementsType [
	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements anyOne class
		equals: FASTJavaInfixOperation 
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithInfixElementTest >> testNumberOfElementsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements size equals: 1
]
