Class {
	#name : #JavaSmaCCArrayTypeNameTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodArrayType'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeNameTest >> methodArrayType [
	^ 'method() {
          Byte[] buffer = newExchange.getIn().getMandatoryBody(Byte[].class);
	}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeNameTest >> setUp [
	super setUp.
	methodArrayType := (self parseMethod: 'arrayType')
]

{ #category : #tests }
JavaSmaCCArrayTypeNameTest >> testArrayTypeBaseTypeName [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first baseType name equals: 'Byte'.
]

{ #category : #tests }
JavaSmaCCArrayTypeNameTest >> testArrayTypeBaseTypeParentNode [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first baseType parentNode equals: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first.
]

{ #category : #tests }
JavaSmaCCArrayTypeNameTest >> testArrayTypeBaseTypeType [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first baseType class equals: FASTJavaTypeName.
]

{ #category : #tests }
JavaSmaCCArrayTypeNameTest >> testArrayTypeInModelSize [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) size equals: 2
]

{ #category : #tests }
JavaSmaCCArrayTypeNameTest >> testArrayTypeParentNode [
	self assert: ((methodArrayType allWithType: FASTJavaArrayTypeExpression) sort: [:a :b | a startPos < b startPos ]) last parentNode class equals: FASTJavaClassProperty.
]
