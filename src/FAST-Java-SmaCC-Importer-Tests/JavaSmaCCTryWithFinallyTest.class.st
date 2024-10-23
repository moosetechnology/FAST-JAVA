Class {
	#name : 'JavaSmaCCTryWithFinallyTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
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

{ #category : 'tests' }
JavaSmaCCTryWithFinallyTest >> testTryCatchFinallyPartNumberOfStatements [
	self assert: fastMethod statements second finally statements size equals: 1
]

{ #category : 'tests' }
JavaSmaCCTryWithFinallyTest >> testTryCatchFinallyPartType [
	self assert: fastMethod statements second finally class equals: FASTJavaStatementBlock
]

{ #category : 'tests' }
JavaSmaCCTryWithFinallyTest >> testTryCatchType [
	self assert: fastMethod statements second class equals: FASTJavaTryCatchStatement
]
