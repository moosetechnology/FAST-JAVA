Class {
	#name : #JavaSmaCCLabeledStatement,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'method'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCLabeledStatement >> methodWithLabeledStatement [
	
	^ 'String methodWithLabeledStatement() {
		 myLabel: {
			int i = 3;
			break myLabel; 
    }
	}'
]

{ #category : #running }
JavaSmaCCLabeledStatement >> setUp [

	super setUp.
	method := (self parseMethodString:
		                        self methodWithLabeledStatement)
		                       allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCLabeledStatement >> testLabeledStatementLabelValue [

	self
		assert: method statements first class
		equals: FASTJavaLabeledStatement
]
