Class {
	#name : 'JavaSmaCCTryCatchesTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCTryCatchesTest >> javaMethod [
	^ 'void tryCatch() {
	int x;
	try {
		x = 1;
   }
	catch (PatateException pe) {
		Patate.displayError(pe.getMessage());
	} 
	catch (Exception ex) {
		Patate.displayError(ex.getMessage());
	};
}
'
]

{ #category : 'tests' }
JavaSmaCCTryCatchesTest >> testTryCatchCatchBodyType [
	self assert: fastMethod statements second catches first body class equals: FASTJavaStatementBlock
]

{ #category : 'tests' }
JavaSmaCCTryCatchesTest >> testTryCatchCatchNumber [
	self assert: fastMethod statements second catches size equals: 2.

]

{ #category : 'tests' }
JavaSmaCCTryCatchesTest >> testTryCatchCatchParametersName [
	self assert: fastMethod statements second catches first parameter name equals: 'pe'.
	self assert: fastMethod statements second catches second parameter name equals: 'ex'.
]

{ #category : 'tests' }
JavaSmaCCTryCatchesTest >> testTryCatchCatchParametersType [
	self assert: fastMethod statements second catches first parameter class equals: FASTJavaVariableExpression.
	self assert: fastMethod statements second catches second parameter class equals: FASTJavaVariableExpression.
]

{ #category : 'tests' }
JavaSmaCCTryCatchesTest >> testTryCatchCatchedType [
	| catchedTypes |
	catchedTypes := fastMethod statements second catches first catchedTypes.

	self assert: catchedTypes size equals: 1.
	self assert: catchedTypes anyOne typeName name equals: 'PatateException'.
	
	catchedTypes := fastMethod statements second catches second catchedTypes.

	self assert: catchedTypes size equals: 1.
	self assert: catchedTypes anyOne typeName name equals: 'Exception'.

]

{ #category : 'tests' }
JavaSmaCCTryCatchesTest >> testTryCatchType [
	self assert: fastMethod statements second class equals: FASTJavaTryCatchStatement
]
