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

{ #category : #tests }
JavaSmaCCArrayTypeTest >> testArrayTypeBaseTypeParentNode [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first baseType parentNode equals: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first.
]

{ #category : #tests }
JavaSmaCCArrayTypeTest >> testArrayTypeBaseTypeType [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first baseType class equals: FASTJavaByteTypeExpression.
]

{ #category : #tests }
JavaSmaCCArrayTypeTest >> testArrayTypeInModelSize [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) size equals: 2
]

{ #category : #tests }
JavaSmaCCArrayTypeTest >> testArrayTypeParentNode [
	self assert: ((methodArrayType allWithType: FASTJavaArrayTypeExpression) sort: [:a :b | a startPos < b startPos ]) last parentNode class equals: FASTJavaClassProperty.
]
