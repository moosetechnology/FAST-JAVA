Class {
	#name : 'JavaSmaCCArrayTypeTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCArrayTypeTest >> javaMethod [
	^ 'method() {
          byte[] buffer = newExchange.getIn().getMandatoryBody(byte[].class);
	}'
]

{ #category : 'tests' }
JavaSmaCCArrayTypeTest >> testArrayTypeBaseTypeParentNode [
	self assert: (fastModel allWithType: FASTJavaArrayTypeExpression) first baseType parentNode equals: (fastModel allWithType: FASTJavaArrayTypeExpression) first.
]

{ #category : 'tests' }
JavaSmaCCArrayTypeTest >> testArrayTypeBaseTypeType [
	self assert: (fastModel allWithType: FASTJavaArrayTypeExpression) first baseType class equals: FASTJavaByteTypeExpression.
]

{ #category : 'tests' }
JavaSmaCCArrayTypeTest >> testArrayTypeInModelSize [
	self assert: (fastModel allWithType: FASTJavaArrayTypeExpression) size equals: 2
]

{ #category : 'tests' }
JavaSmaCCArrayTypeTest >> testArrayTypeParentNode [
	self assert: ((fastModel allWithType: FASTJavaArrayTypeExpression) sort: [:a :b | a startPos < b startPos ]) last parentNode class equals: FASTJavaClassProperty.
]
