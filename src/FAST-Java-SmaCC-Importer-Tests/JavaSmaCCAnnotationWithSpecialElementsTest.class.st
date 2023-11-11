Class {
	#name : #JavaSmaCCAnnotationWithSpecialElementsTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNewArray'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #accessing }
JavaSmaCCAnnotationWithSpecialElementsTest >> javaMethod [
	^ '@Useless( array={ @OtherAnnotation }, value=RetentionPolicy.RUNTIME )
	void arrayLiteral() {
}'
]

{ #category : #tests }
JavaSmaCCAnnotationWithSpecialElementsTest >> testAnnotationFirstElementType [
	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements first expression values anyOne class 
		equals: FASTJavaAnnotation
]

{ #category : #tests }
JavaSmaCCAnnotationWithSpecialElementsTest >> testAnnotationSecondElementType [
	self
		assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements second expression class 
		equals: FASTJavaClassProperty
]

{ #category : #tests }
JavaSmaCCAnnotationWithSpecialElementsTest >> testNumberOfElementsInArrayElement [
	self assert: (fastModel allWithType: FASTJavaArrayAnnotationElement) first values size equals: 1
]

{ #category : #tests }
JavaSmaCCAnnotationWithSpecialElementsTest >> testNumberOfElementsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne elements size equals: 2
]
