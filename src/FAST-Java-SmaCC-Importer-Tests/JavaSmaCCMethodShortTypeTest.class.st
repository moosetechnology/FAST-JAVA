Class {
	#name : #JavaSmaCCMethodShortTypeTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodType'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCMethodShortTypeTest >> methodType [
	 ^ 'short hello(){}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodShortTypeTest >> setUp [
	super setUp.
	methodType := (self parseMethod: 'Type')
]

{ #category : #tests }
JavaSmaCCMethodShortTypeTest >> testMethodTypeType [
	self assert: (methodType allWithType: FASTJavaMethodEntity) anyOne type class equals: FASTJavaShortTypeExpression
]
