Class {
	#name : 'JavaSmaCCNumericLiteralTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCNumericLiteralTest >> javaMethod [
	^ 'void literals() {
	int anInt = 12;
	long aLong = 12L;
	long anHexadecimalLong = 0xFFl;
	float aFloat = 12.3f;
	double aDouble = 12.3;
	double aSuffixedDouble = 12.3d;
	double anExponent = 1e3;
}'
]

{ #category : 'accessing' }
JavaSmaCCNumericLiteralTest >> literalAt: anIndex [
	^ (fastMethod statements at: anIndex) declarators first expression
]

{ #category : 'tests' }
JavaSmaCCNumericLiteralTest >> testNumericLiteralType [
	"JLS 3.10.1 and 3.10.2: the suffix alone tells the type of a numeric literal."

	self assert: (self literalAt: 1) class equals: FASTJavaIntegerLiteral.
	self assert: (self literalAt: 2) class equals: FASTJavaLongLiteral.
	self assert: (self literalAt: 3) class equals: FASTJavaLongLiteral.
	self assert: (self literalAt: 4) class equals: FASTJavaFloatLiteral.
	self assert: (self literalAt: 5) class equals: FASTJavaDoubleLiteral.
	self assert: (self literalAt: 6) class equals: FASTJavaDoubleLiteral.
	self assert: (self literalAt: 7) class equals: FASTJavaDoubleLiteral
]

{ #category : 'tests' }
JavaSmaCCNumericLiteralTest >> testNumericLiteralValue [
	"The literal keeps the suffix it was written with."

	self assert: (self literalAt: 1) primitiveValue equals: '12'.
	self assert: (self literalAt: 2) primitiveValue equals: '12L'.
	self assert: (self literalAt: 3) primitiveValue equals: '0xFFl'.
	self assert: (self literalAt: 4) primitiveValue equals: '12.3f'.
	self assert: (self literalAt: 5) primitiveValue equals: '12.3'.
	self assert: (self literalAt: 6) primitiveValue equals: '12.3d'.
	self assert: (self literalAt: 7) primitiveValue equals: '1e3'
]
