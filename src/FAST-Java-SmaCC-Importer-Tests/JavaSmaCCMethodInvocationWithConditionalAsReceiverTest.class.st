"
This class contains tests
"
Class {
	#name : #JavaSmaCCMethodInvocationWithConditionalAsReceiverTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCMethodInvocationWithConditionalAsReceiverTest >> testClassPropertyReceiverMethodInvocations [
	self assert: fastMethod statements first children anyOne receiver class equals: FASTJavaConditionalExpression
]
