Class {
	#name : #JavaSmaCCMethodModifiersTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCMethodModifiersTest >> javaMethod [
	 ^ '
	@Hello
	private transient void hello(){}'
]

{ #category : #tests }
JavaSmaCCMethodModifiersTest >> testMethodAnnotationExpression [
	self assert: (fastModel allWithType: FASTJavaAnnotation) anyOne expression class equals: FASTJavaVariableExpression
]

{ #category : #tests }
JavaSmaCCMethodModifiersTest >> testMethodModifiersNumber [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne modifiers size equals: 3
]
