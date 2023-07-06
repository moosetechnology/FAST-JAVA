"
This class contains tests
"
Class {
	#name : #JavaSmaCCMethodInvocationWithConditionalAsReceiverTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCMethodInvocationWithConditionalAsReceiverTest >> javaMethod [
	^ 'public void onClick(ClickEvent arg0) {
		(ratioDTO==null?"":"").method("");
	}'
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithConditionalAsReceiverTest >> testClassPropertyReceiverMethodInvocations [
	self assert: fastMethod statements first children anyOne receiver class equals: FASTJavaConditionalExpression
]
