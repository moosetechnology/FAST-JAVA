Class {
	#name : #JavaSmaCCLabeledStatementTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCLabeledStatementTest >> javaMethod [
	
	^ 'String methodWithLabeledStatement() {
		 myLabel: {
			int i = 3;
			break myLabel; 
    }
	}'
]

{ #category : #tests }
JavaSmaCCLabeledStatementTest >> testLabeledStatementLabelValue [

	self
		assert: fastMethod statements first class
		equals: FASTJavaLabeledStatement
]
