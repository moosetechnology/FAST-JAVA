Class {
	#name : #JavaSmaCCTryCatchesTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCTryCatchesTest >> javaMethod [
	^ 'void tryCatch() {
	int x;
	try {
		x = 1;
   }
	catch (PatateException e) {
		Patate.displayError(e.getMessage());
	} 
	catch (Exception e) {
		Patate.displayError(e.getMessage());
	};
}
'
]

{ #category : #tests }
JavaSmaCCTryCatchesTest >> testTryCatchCatchBodyType [
	self assert: fastMethod statements second catches first body class equals: FASTJavaStatementBlock
]

{ #category : #tests }
JavaSmaCCTryCatchesTest >> testTryCatchCatchNumber [
	self assert: fastMethod statements second catches size equals: 2.

]

{ #category : #tests }
JavaSmaCCTryCatchesTest >> testTryCatchCatchParametersName [
	self assert: fastMethod statements second catches first parameter name equals: 'e'
]

{ #category : #tests }
JavaSmaCCTryCatchesTest >> testTryCatchCatchParametersType [
	self assert: fastMethod statements second catches first parameter class equals: FASTJavaVariableExpression
]

{ #category : #tests }
JavaSmaCCTryCatchesTest >> testTryCatchTryPartType [
	self assert: fastMethod statements second try class equals: FASTJavaStatementBlock
]

{ #category : #tests }
JavaSmaCCTryCatchesTest >> testTryCatchType [
	self assert: fastMethod statements second class equals: FASTJavaTryCatchStatement
]
