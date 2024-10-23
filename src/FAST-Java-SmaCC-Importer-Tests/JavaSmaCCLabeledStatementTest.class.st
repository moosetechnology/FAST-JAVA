Class {
	#name : 'JavaSmaCCLabeledStatementTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCLabeledStatementTest >> javaMethod [
	
	^ 'void methodWithLabeledStatement() {
		 myLabel: return;
	}'
]

{ #category : 'tests' }
JavaSmaCCLabeledStatementTest >> testLabeledStatementInnerStatementType [

	self
		assert: fastMethod statements first labeledStatement class
		equals: FASTJavaReturnStatement
]

{ #category : 'tests' }
JavaSmaCCLabeledStatementTest >> testLabeledStatementLabelValue [

	self
		assert: fastMethod statements first label
		equals: 'myLabel'
]

{ #category : 'tests' }
JavaSmaCCLabeledStatementTest >> testLabeledStatementType [

	self
		assert: fastMethod statements first class
		equals: FASTJavaLabeledStatement
]
