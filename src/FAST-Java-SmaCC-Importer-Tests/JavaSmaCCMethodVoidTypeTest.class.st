Class {
	#name : #JavaSmaCCMethodVoidTypeTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodType'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCMethodVoidTypeTest >> methodType [
	 ^ 'void hello(){}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodVoidTypeTest >> setUp [
	super setUp.
	methodType := (self parseMethod: 'Type')
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodVoidTypeTest >> testMethodTypeType [
	self assert: (methodType allWithType: FASTJavaMethodEntity) anyOne type class equals: FASTJavaVoidTypeExpression
]
