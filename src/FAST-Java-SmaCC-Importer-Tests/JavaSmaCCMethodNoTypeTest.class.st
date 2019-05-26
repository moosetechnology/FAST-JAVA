Class {
	#name : #JavaSmaCCMethodNoTypeTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodType'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCMethodNoTypeTest >> methodType [
	 ^ 'hello(){}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodNoTypeTest >> setUp [
	super setUp.
	methodType := (self parseMethod: 'Type')
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodNoTypeTest >> testMethodTypeType [
	self assert: (methodType allWithType: FASTJavaMethodEntity) anyOne type equals: nil
]
