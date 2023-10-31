Class {
	#name : #JavaSmaCCLabeledStatementBlockTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCLabeledStatementBlockTest >> javaMethod [
	
	^ 'String methodWithLabeledStatement() {
		 myLabel: {
			int i = 3;
			break myLabel; 
    }
	}'
]

{ #category : #tests }
JavaSmaCCLabeledStatementBlockTest >> testLabeledStatementInnerStatementType [

	self
		assert: fastMethod statements first labeledStatement class
		equals: FASTJavaStatementBlock
]

{ #category : #tests }
JavaSmaCCLabeledStatementBlockTest >> testLabeledStatementLabelValue [

	self
		assert: fastMethod statements first label
		equals: 'myLabel'
]

{ #category : #tests }
JavaSmaCCLabeledStatementBlockTest >> testLabeledStatementType [

	self
		assert: fastMethod statements first class
		equals: FASTJavaLabeledStatement
]
