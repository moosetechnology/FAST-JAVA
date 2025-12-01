Class {
	#name : 'JavaSmaCCAssertionWithAnExpressionTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCAssertionWithAnExpressionTest >> javaMethod [
	^ 'void assertMethod() {
		assert 1 == 3 : "A message" + " of error";
	}'
]

{ #category : 'tests' }
JavaSmaCCAssertionWithAnExpressionTest >> testAssertNodeMessage [
	self assert: (fastModel allWithType: FASTJavaAssertStatement) anyOne message class equals: FASTJavaInfixOperation
]

{ #category : 'tests' }
JavaSmaCCAssertionWithAnExpressionTest >> testAssertNodeMessageParentNode [
	self assert: (fastModel allWithType: FASTJavaAssertStatement) anyOne equals: (fastModel allWithType: FASTJavaAssertStatement) anyOne message parentNode
]
