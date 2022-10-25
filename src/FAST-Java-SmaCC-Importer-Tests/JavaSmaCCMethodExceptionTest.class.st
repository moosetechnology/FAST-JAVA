Class {
	#name : #JavaSmaCCMethodExceptionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodException'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCMethodExceptionTest >> methodMethodReference [
	^ 'void method() throws MyException {
}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCMethodExceptionTest >> setUp [

	super setUp.
	methodException := self parseMethodString:
		                         self methodMethodReference
]

{ #category : #tests }
JavaSmaCCMethodExceptionTest >> testOnlyOneThrowsEntity [

	self
		assert: (methodException allWithType: FASTJavaMethodEntity) size
		equals: 1.
	self
		assert:
		(methodException allWithType: FASTJavaMethodEntity) anyOne throws size
		equals: 1
]
