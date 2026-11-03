Class {
	#name : 'JavaSmaCCArrayTypeNameTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCArrayTypeNameTest >> javaMethod [
	^ 'method() {
	Byte[] buffer = newExchange.getIn().getMandatoryBody(Byte[].class);
}'
]

{ #category : 'tests' }
JavaSmaCCArrayTypeNameTest >> testArrayTypeBaseTypeName [
	self assert: (fastModel allWithType: FASTJavaArrayTypeExpression) first baseType name equals: 'Byte'.
]

{ #category : 'tests' }
JavaSmaCCArrayTypeNameTest >> testArrayTypeBaseTypeParentNode [
	self assert: (fastModel allWithType: FASTJavaArrayTypeExpression) first baseType parentNode equals: (fastModel allWithType: FASTJavaArrayTypeExpression) first.
]

{ #category : 'tests' }
JavaSmaCCArrayTypeNameTest >> testArrayTypeBaseTypeType [
	self assert: (fastModel allWithType: FASTJavaArrayTypeExpression) first baseType class equals: FASTJavaTypeName.
]

{ #category : 'tests' }
JavaSmaCCArrayTypeNameTest >> testArrayTypeInModelSize [
	self assert: (fastModel allWithType: FASTJavaArrayTypeExpression) size equals: 2
]

{ #category : 'tests' }
JavaSmaCCArrayTypeNameTest >> testArrayTypeParentNode [
	"JLS 15.8.2: `int[].class` is a class literal, and the array type it names belongs to it."

	self
		assert: ((fastModel allWithType: FASTJavaArrayTypeExpression) sort: [ :a :b | a startPos < b startPos ]) last parentNode class
		equals: FASTJavaClassLiteral
]
