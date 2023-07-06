Class {
	#name : #JavaSmaCCArray2DTypeTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCArray2DTypeTest >> javaMethod [
	^ 'method() {
          byte[][] buffer;
	}'
]

{ #category : #tests }
JavaSmaCCArray2DTypeTest >> testArrayTypeBaseTypeBaseTypeType [

	self
		assert:
			(fastModel allWithType: FASTJavaArrayTypeExpression) second
				baseType baseType class
		equals: FASTJavaByteTypeExpression
]

{ #category : #tests }
JavaSmaCCArray2DTypeTest >> testArrayTypeBaseTypeParentNode [

	self
		assert:
		(fastModel allWithType: FASTJavaArrayTypeExpression) second
		equals:
			(fastModel allWithType: FASTJavaArrayTypeExpression) first
				parentNode
]

{ #category : #tests }
JavaSmaCCArray2DTypeTest >> testArrayTypeBaseTypeType [

	self
		assert:
			(fastModel allWithType: FASTJavaArrayTypeExpression) second
				baseType class
		equals: FASTJavaArrayTypeExpression
]

{ #category : #tests }
JavaSmaCCArray2DTypeTest >> testArrayTypeInModelSize [

	self
		assert:
		(fastModel allWithType: FASTJavaArrayTypeExpression) size
		equals: 2
]
