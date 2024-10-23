Class {
	#name : 'JavaSmaCCArrayAccessTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCArrayAccessTest >> javaMethod [
	^ 'void arrayAccess() {
   int j = array1[i];
   int k = array2[i][j];
}'
]

{ #category : 'tests' }
JavaSmaCCArrayAccessTest >> testArrayAccessParent [

	self assert: fastMethod statements anyOne declarators anyOne expression array parentNode equals: fastMethod statements first declarators anyOne expression.
]

{ #category : 'tests' }
JavaSmaCCArrayAccessTest >> testNamedEntityName [
	self assert: fastMethod statements first declarators anyOne expression array name equals: 'array1'.
	self assert: fastMethod statements second declarators anyOne expression array array name equals: 'array2'.
]

{ #category : 'tests' }
JavaSmaCCArrayAccessTest >> testNumberOfarrayAccess [
	self assert: (fastMethod mooseModel allWithType: FASTJavaArrayAccess) size equals: 3
]

{ #category : 'tests' }
JavaSmaCCArrayAccessTest >> testSubArrayType [
	self assert: fastMethod statements second declarators anyOne expression array class equals: FASTJavaArrayAccess.
	self assert: fastMethod statements second declarators anyOne expression array array class equals: FASTJavaVariableExpression.
]
