Class {
	#name : 'JavaSmaCCTryCatchMultipleExceptionsTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCTryCatchMultipleExceptionsTest >> javaMethod [
	^ 'void tryCatch() {
	int x;
	try {
		x = 1;
   } catch (Exception | PatateException e) {
		e.getMessage();
	};
}
'
]

{ #category : 'tests' }
JavaSmaCCTryCatchMultipleExceptionsTest >> testTryCatchCatchBodyType [
	self assert: fastMethod statements second catches first body class equals: FASTJavaStatementBlock
]

{ #category : 'tests' }
JavaSmaCCTryCatchMultipleExceptionsTest >> testTryCatchCatchNumber [
	self assert: fastMethod statements second catches size equals: 1
]

{ #category : 'tests' }
JavaSmaCCTryCatchMultipleExceptionsTest >> testTryCatchCatchParametersName [
	self
		assert: fastMethod statements second catches first parameter name
		equals: 'e'
]

{ #category : 'tests' }
JavaSmaCCTryCatchMultipleExceptionsTest >> testTryCatchCatchParametersType [
	self
		assert: fastMethod statements second catches first parameter class
		equals: FASTJavaVariableExpression
]

{ #category : 'tests' }
JavaSmaCCTryCatchMultipleExceptionsTest >> testTryCatchCatchedType [
	| catchedTypes |
	catchedTypes := fastMethod statements second catches first catchedTypes.

	self assert: catchedTypes size equals: 2.
	self assert: catchedTypes first typeName name equals: 'Exception'.
	self assert: catchedTypes second typeName name equals: 'PatateException'
]

{ #category : 'tests' }
JavaSmaCCTryCatchMultipleExceptionsTest >> testTryCatchTryPartType [
	self assert: fastMethod statements second try class equals: FASTJavaStatementBlock
]

{ #category : 'tests' }
JavaSmaCCTryCatchMultipleExceptionsTest >> testTryCatchType [
	self assert: fastMethod statements second class equals: FASTJavaTryCatchStatement
]
