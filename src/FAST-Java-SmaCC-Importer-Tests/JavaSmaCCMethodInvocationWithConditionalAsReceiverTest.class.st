"
This class contains tests
"
Class {
	#name : 'JavaSmaCCMethodInvocationWithConditionalAsReceiverTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMethodInvocationWithConditionalAsReceiverTest >> javaMethod [

	^ 'public void onClick(ClickEvent arg0) {
	(ratioDTO==null?"":"").method("");
}'
]

{ #category : 'tests' }
JavaSmaCCMethodInvocationWithConditionalAsReceiverTest >> testClassPropertyReceiverMethodInvocations [

	self assert: fastMethod statements first containedEntities anyOne receiver class equals: FASTJavaConditionalExpression
]
