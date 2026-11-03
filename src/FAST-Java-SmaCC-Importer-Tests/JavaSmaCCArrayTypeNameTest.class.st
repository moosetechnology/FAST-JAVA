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
	self assert: (fastModel allWithType: FASTJavaArrayTypeExpression) first baseType typeName name equals: 'Byte'
]

{ #category : 'tests' }
JavaSmaCCArrayTypeNameTest >> testArrayTypeBaseTypeParentNode [
	self assert: (fastModel allWithType: FASTJavaArrayTypeExpression) first baseType parentNode equals: (fastModel allWithType: FASTJavaArrayTypeExpression) first.
]

{ #category : 'tests' }
JavaSmaCCArrayTypeNameTest >> testArrayTypeBaseTypeType [
	"JLS 10.1: the element type of an array is a type, so a name written as one is read as
	the class type it stands for."

	self assert: (fastModel allWithType: FASTJavaArrayTypeExpression) first baseType class equals: FASTJavaClassTypeExpression
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

{ #category : 'tests' }
JavaSmaCCArrayTypeNameTest >> testEveryElementTypeIsAType [
	"JLS 10.1: the element type of an array is a type, however the array is written — a
	class type, a primitive type or another array type — so `baseType` holds one kind of
	thing and never a bare name."

	| arrays model |
	model := self parseMethodString: 'void m(Byte[] a, int[] b, java.util.List<String>[] c, String[][] d) {}'.
	arrays := model allWithType: FASTJavaArrayTypeExpression.
	self assert: arrays size equals: 5.
	self assert: (arrays allSatisfy: [ :array | array baseType isTypeExpression ])
]
