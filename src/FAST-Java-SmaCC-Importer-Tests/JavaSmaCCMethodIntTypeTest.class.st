Class {
	#name : #JavaSmaCCMethodIntTypeTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodType'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCMethodIntTypeTest >> methodType [
	 ^ 'int hello(){}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodIntTypeTest >> setUp [
	super setUp.
	methodType := (self parseMethod: 'Type')
]

{ #category : #tests }
JavaSmaCCMethodIntTypeTest >> testMethodTypeType [
	self assert: (methodType allWithType: FASTJavaMethodEntity) anyOne type class equals: FASTJavaIntTypeExpression
]
