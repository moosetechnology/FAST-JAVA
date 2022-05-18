Class {
	#name : #JavaSmaCCArray2DTypeTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodArrayType'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCArray2DTypeTest >> methodArrayType [
	^ 'method() {
          byte[][] buffer;
	}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCArray2DTypeTest >> setUp [
	super setUp.
	methodArrayType := (self parseMethod: 'arrayType')
]

{ #category : #tests }
JavaSmaCCArray2DTypeTest >> testArrayTypeBaseTypeBaseTypeType [

	self
		assert:
			(methodArrayType allWithType: FASTJavaArrayTypeExpression) second
				baseType baseType class
		equals: FASTJavaByteTypeExpression
]

{ #category : #tests }
JavaSmaCCArray2DTypeTest >> testArrayTypeBaseTypeParentNode [

	self
		assert:
		(methodArrayType allWithType: FASTJavaArrayTypeExpression) second
		equals:
			(methodArrayType allWithType: FASTJavaArrayTypeExpression) first
				parentNode
]

{ #category : #tests }
JavaSmaCCArray2DTypeTest >> testArrayTypeBaseTypeType [

	self
		assert:
			(methodArrayType allWithType: FASTJavaArrayTypeExpression) second
				baseType class
		equals: FASTJavaArrayTypeExpression
]

{ #category : #tests }
JavaSmaCCArray2DTypeTest >> testArrayTypeInModelSize [

	self
		assert:
		(methodArrayType allWithType: FASTJavaArrayTypeExpression) size
		equals: 2
]
