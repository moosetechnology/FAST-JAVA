Class {
	#name : #JavaSmaCCTryWithFinallyTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCTryWithFinallyTest >> javaMethod [
	^ 'void tryCatch() {
	int x;
	try {
		x = 1;
   } finally {
		Patate.displayError(e.getMessage());
	};
}
'
]

{ #category : #tests }
JavaSmaCCTryWithFinallyTest >> testTryCatchCatchNumber [
	self assert: fastMethod statements second catches size equals: 0
]

{ #category : #tests }
JavaSmaCCTryWithFinallyTest >> testTryCatchFinallyPartType [
	self assert: fastMethod statements second finally class equals: FASTJavaStatementBlock
]

{ #category : #tests }
JavaSmaCCTryWithFinallyTest >> testTryCatchTryPartType [
	self assert: fastMethod statements second try class equals: FASTJavaStatementBlock
]

{ #category : #tests }
JavaSmaCCTryWithFinallyTest >> testTryCatchType [
	self assert: fastMethod statements second class equals: FASTJavaTryCatchStatement
]
