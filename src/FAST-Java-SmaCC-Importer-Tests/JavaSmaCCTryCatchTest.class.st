Class {
	#name : #JavaSmaCCTryCatchTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCTryCatchTest >> javaMethod [
	^ 'void tryCatch() {
	int x;
	try {
		x = 1;
   } catch (Exception e) {
		Patate.displayError(e.getMessage());
	};
}
'
]

{ #category : #tests }
JavaSmaCCTryCatchTest >> testTryCatchCatchBodyType [
	self assert: fastMethod statements second catches first body class equals: FASTJavaStatementBlock
]

{ #category : #tests }
JavaSmaCCTryCatchTest >> testTryCatchCatchNumber [
	self assert: fastMethod statements second catches size equals: 1
]

{ #category : #tests }
JavaSmaCCTryCatchTest >> testTryCatchCatchParametersName [
	self
		assert: fastMethod statements second catches first parameter name
		equals: 'e'
]

{ #category : #tests }
JavaSmaCCTryCatchTest >> testTryCatchCatchParametersType [
	self
		assert: fastMethod statements second catches first parameter class
		equals: FASTJavaVariableExpression
]

{ #category : #tests }
JavaSmaCCTryCatchTest >> testTryCatchCatchedType [
	| catchedTypes |
	catchedTypes := fastMethod statements second catches first catchedTypes.

	self assert: catchedTypes size equals: 1.
	self assert: catchedTypes anyOne typeName name equals: 'Exception'
]

{ #category : #tests }
JavaSmaCCTryCatchTest >> testTryCatchFinallyPartType [
	self assert: fastMethod statements second finally equals: nil
]

{ #category : #tests }
JavaSmaCCTryCatchTest >> testTryCatchTryPartType [
	self assert: fastMethod statements second try class equals: FASTJavaStatementBlock
]

{ #category : #tests }
JavaSmaCCTryCatchTest >> testTryCatchType [
	self assert: fastMethod statements second class equals: FASTJavaTryCatchStatement
]
