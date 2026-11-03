Class {
	#name : 'JavaSmaCCNewArrayTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
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
JavaSmaCCNewArrayTest >> testNewArrayDimensionsCountsItsBrackets [
	"JLS 15.10.1: `dimensions` answers how many pairs of brackets a creation writes, as it
	does for a parameter, a declarator and a method."

	self assert: (fastModel allWithType: FASTJavaNewArray) second dimensions equals: 1
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArrayIsNotAClassInstanceCreation [
	"JLS 15.10.1: an array creation writes no arguments, no type arguments and no enclosing
	instance, so it is an expression of its own and not a class instance creation."

	| newArray |
	newArray := (fastModel allWithType: FASTJavaNewArray) second.
	self deny: (newArray isKindOf: FASTJavaNewExpression).
	self deny: newArray isNewExpression.
	self assert: newArray isNewArray
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
	self assert: (fastModel allWithType: FASTJavaNewArray) second brackets size equals: 1
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArraySimpleArraySizeParent [
	| newArray |
	newArray := (fastModel allWithType: FASTJavaNewArray) second.
	self assert: newArray brackets anyOne parentNode equals: newArray.
	self assert: newArray brackets anyOne expression parentNode equals: newArray brackets anyOne
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArraySimpleArraySizeType [
	self assert: (fastModel allWithType: FASTJavaNewArray) second brackets anyOne expression class equals: FASTJavaIntegerLiteral
]

{ #category : 'tests' }
JavaSmaCCNewArrayTest >> testNewArraySize [
	self assert: (fastModel allWithType: FASTJavaNewArray) size equals: 2
]
