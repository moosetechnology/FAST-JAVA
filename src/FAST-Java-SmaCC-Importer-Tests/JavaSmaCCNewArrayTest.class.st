Class {
	#name : 'JavaSmaCCNewArrayTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCNewArrayTest >> javaMethod [
	^ 'void innerNewClass() {
	String[] s2 = new String[] { "a", "b", "c"};
	String[] s3 = new String[3];
}'
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArrayAutoCreatedArrayInitializersParent [
	self assert: (fastModel allWithType: FASTJavaNewArray) first initializer initializers anyOne parentNode
		equals: (fastModel allWithType: FASTJavaNewArray) first initializer
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArrayAutoCreatedArrayInitializersSize [
	self assert: (fastModel allWithType: FASTJavaNewArray) first initializer initializers size equals: 3 
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArrayParent [
	self assert: (fastModel allWithType: FASTJavaNewArray) first parentNode equals: fastMethod statementBlock statements first declarators first.
	self assert: (fastModel allWithType: FASTJavaNewArray) second parentNode equals: fastMethod statementBlock statements second declarators first.
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArraySimpleArrayAsChild [
	self assert: (fastModel allWithType: FASTJavaNewArray) second equals: fastMethod statementBlock statements second declarators first expression
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArraySimpleArrayParent [
	self assert: (fastModel allWithType: FASTJavaNewArray) second parentNode equals: fastMethod statementBlock statements second declarators first
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArraySimpleArraySize [
	self assert: (fastModel allWithType: FASTJavaNewArray) second arguments size equals: 1
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArraySimpleArraySizeParent [
	self assert: (fastModel allWithType: FASTJavaNewArray) second arguments anyOne parentNode equals: (fastModel allWithType: FASTJavaNewArray) second 
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArraySimpleArraySizeType [
	self assert: (fastModel allWithType: FASTJavaNewArray) second arguments anyOne class equals: FASTJavaIntegerLiteral 
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArraySize [
	self assert: (fastModel allWithType: FASTJavaNewArray) size equals: 2
]
