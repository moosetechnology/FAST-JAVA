Class {
	#name : 'JavaSmaCCAnnotationWithArrayElementTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCAnnotationWithArrayElementTest >> javaMethod [
	^ '@Useless( { "hello", "world" } )
	void arrayLiteral() {}'
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithArrayElementTest >> testElementsType [
	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements anyOne class
		equals: FASTJavaArrayAnnotationElement
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithArrayElementTest >> testNumberOfElementsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements size equals: 1
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithArrayElementTest >> testNumberOfInitializedElement [
	self assert: (fastModel allWithType: FASTJavaArrayAnnotationElement) first values size equals: 2
]
