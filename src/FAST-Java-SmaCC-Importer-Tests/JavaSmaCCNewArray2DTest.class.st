Class {
	#name : 'JavaSmaCCNewArray2DTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCNewArray2DTest >> javaMethod [
	^ 'void innerNewClass() {
	String[][] s2 = new String[][] { {"a", "b", "c"} };
	String[][] s3 = new String[3][4];
}'
]

{ #category : 'tests' }
JavaSmaCCNewArray2DTest >> testNewArrayEmptySize [
	"JLS 15.10.1: a creation that writes an initializer leaves every pair of brackets
	empty, so no pair of this one says a length."

	| newArray |
	newArray := (fastModel allWithType: FASTJavaNewArray) first.
	self assert: newArray brackets first class equals: FASTJavaDimension.
	self assert: newArray brackets second class equals: FASTJavaDimension
]

{ #category : 'tests' }
JavaSmaCCNewArray2DTest >> testNewArraySimpleArraySize [
	self assert: (fastModel allWithType: FASTJavaNewArray) first brackets size equals: 2
]

{ #category : 'tests' }
JavaSmaCCNewArray2DTest >> testNewArrayWrittenSizes [
	"JLS 15.10.1: `new String[3][4]` says a length for both of its brackets."

	| newArray |
	newArray := (fastModel allWithType: FASTJavaNewArray) second.
	self assert: (newArray brackets collect: [ :dimension | dimension class ]) asArray
		equals: { FASTJavaDimensionExpression. FASTJavaDimensionExpression }.
	self assert: (newArray brackets collect: [ :dimension | dimension expression primitiveValue ]) asArray
		equals: #( '3' '4' )
]
