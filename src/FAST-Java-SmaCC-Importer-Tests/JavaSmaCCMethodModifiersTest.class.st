Class {
	#name : 'JavaSmaCCMethodModifiersTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'as yet unclassified' }
JavaSmaCCMethodModifiersTest >> javaMethod [
	 ^ '
	@Hello
	private transient void hello(){}'
]

{ #category : 'tests' }
JavaSmaCCMethodModifiersTest >> testMethodModifiersAnnotationNumber [
	self
		assert: ((fastModel allWithType: FASTJavaMethodEntity) anyOne modifiers count: [ :mod | mod class = FASTJavaAnnotation ])
		equals: 1
]

{ #category : 'tests' }
JavaSmaCCMethodModifiersTest >> testMethodModifiersNumber [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne modifiers size equals: 3
]
