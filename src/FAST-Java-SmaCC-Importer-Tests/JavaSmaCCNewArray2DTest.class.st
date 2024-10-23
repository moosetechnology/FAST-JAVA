Class {
	#name : 'JavaSmaCCNewArray2DTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCNewArray2DTest >> javaMethod [
	^ 'void innerNewClass() {
	String[][] s2 = new String[][] { {"a", "b", "c"} };
	String[][] s3 = new String[3][4];
}'
]

{ #category : 'tests' }
JavaSmaCCNewArray2DTest >> testNewArrayEmptySize [
	self assert: (fastModel allWithType: FASTJavaNewArray) first arguments first class equals: FASTJavaEmptyDimExpression .
	self assert: (fastModel allWithType: FASTJavaNewArray) first arguments second class equals: FASTJavaEmptyDimExpression.
]

{ #category : 'tests' }
JavaSmaCCNewArray2DTest >> testNewArraySimpleArraySize [
	self assert: (fastModel allWithType: FASTJavaNewArray) first arguments size equals: 2
]
