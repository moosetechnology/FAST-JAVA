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
	^ '@Useless( { @OtherAnnotation} )
	void arrayLiteral() {
}'
]

{ #category : #tests }
JavaSmaCCAnnotationWithSpecialElementsTest >> testInitializedElementType [
	self
		assert: (fastModel allWithType: FASTJavaArrayInitializer) anyOne initializers anyOne class 
		equals: FASTJavaAnnotation
]

{ #category : #tests }
JavaSmaCCAnnotationWithSpecialElementsTest >> testNumberOfArgumentsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne arguments size equals: 2
]

{ #category : #tests }
JavaSmaCCAnnotationWithSpecialElementsTest >> testNumberOfInitializedElement [
	self assert: (fastModel allWithType: FASTJavaArrayInitializer) first initializers size equals: 1
]
