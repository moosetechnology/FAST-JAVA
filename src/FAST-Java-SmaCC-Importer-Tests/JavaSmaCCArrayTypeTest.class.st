Class {
	#name : #JavaSmaCCArrayTypeTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodArrayType'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeTest >> methodArrayType [
	^ 'method() {
          byte[] buffer = newExchange.getIn().getMandatoryBody(byte[].class);
	}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeTest >> setUp [
	super setUp.
	methodArrayType := (self parseMethod: 'arrayType')
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeTest >> testArrayTypeBaseTypeParentNode [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first baseType parentNode equals: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first.
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeTest >> testArrayTypeBaseTypeType [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first baseType class equals: FASTJavaByteTypeExpression.
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeTest >> testArrayTypeInModelSize [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) size equals: 1
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeTest >> testArrayTypeParentNode [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first parentNode class equals: FASTJavaClassProperty.
]
