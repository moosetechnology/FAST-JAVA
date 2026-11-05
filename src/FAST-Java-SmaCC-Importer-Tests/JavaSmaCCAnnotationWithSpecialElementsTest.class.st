Class {
	#name : 'JavaSmaCCAnnotationWithSpecialElementsTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCAnnotationWithSpecialElementsTest >> javaMethod [
	^ '@Useless( array={ @OtherAnnotation }, value=RetentionPolicy.RUNTIME )
	void arrayLiteral() {}'
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithSpecialElementsTest >> testAnnotationFirstElementType [

	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements first value values anyOne class
		equals: FASTJavaAnnotation
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithSpecialElementsTest >> testAnnotationSecondElementType [

	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements second value class
		equals: FASTJavaQualifiedName
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithSpecialElementsTest >> testNumberOfElementsInArrayElement [
	self assert: (fastModel allWithType: FASTJavaArrayAnnotationElement) first values size equals: 1
]

{ #category : 'tests' }
JavaSmaCCAnnotationWithSpecialElementsTest >> testNumberOfElementsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements size equals: 2
]
