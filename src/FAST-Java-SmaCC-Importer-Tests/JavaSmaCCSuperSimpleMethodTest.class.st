Class {
	#name : 'JavaSmaCCSuperSimpleMethodTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCSuperSimpleMethodTest >> javaMethod [
	^ 
'boolean supersimple() {
  return true;
}
'
]

{ #category : 'tests' }
JavaSmaCCSuperSimpleMethodTest >> testExpressionParent [
	self assert: fastMethod statements last expression parentNode equals: fastMethod statements last
]

{ #category : 'tests' }
JavaSmaCCSuperSimpleMethodTest >> testExpressionType [
	self assert: fastMethod statements last expression class equals: FASTJavaBooleanLiteral  
]

{ #category : 'tests' }
JavaSmaCCSuperSimpleMethodTest >> testStatementsCount [
	self assert: fastMethod statements size equals: 1
]

{ #category : 'tests' }
JavaSmaCCSuperSimpleMethodTest >> testStatementsType [
	self assert: fastMethod statements last class equals: FASTJavaReturnStatement  
]
