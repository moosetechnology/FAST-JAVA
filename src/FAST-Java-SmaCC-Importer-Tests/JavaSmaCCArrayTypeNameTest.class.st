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

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeNameTest >> testArrayTypeBaseTypeName [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first baseType name equals: 'Byte'.
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeNameTest >> testArrayTypeBaseTypeParentNode [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first baseType parentNode equals: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first.
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeNameTest >> testArrayTypeBaseTypeType [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first baseType class equals: FASTJavaClassTypeExpression.
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeNameTest >> testArrayTypeInModelSize [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) size equals: 1
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayTypeNameTest >> testArrayTypeParentNode [
	self assert: (methodArrayType allWithType: FASTJavaArrayTypeExpression) first parentNode class equals: FASTJavaClassProperty.
]
