Class {
	#name : #JavaSmaCCAnnotationWithArrayLiteralTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNewArray'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #accessing }
JavaSmaCCAnnotationWithArrayLiteralTest >> javaMethod [
	^ '@Useless( {"hello", "world"} )
	void arrayLiteral() {
}'
]

{ #category : #tests }
JavaSmaCCAnnotationWithArrayLiteralTest >> testNumberOfArgumentsToAnnotation [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne arguments size equals: 1
]

{ #category : #tests }
JavaSmaCCAnnotationWithArrayLiteralTest >> testNumberOfInitializedElement [
	self assert: (fastModel allWithType: FASTJavaArrayInitializer) first initializers size equals: 2
]
