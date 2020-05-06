"
This class contains tests
"
Class {
	#name : #JavaSmaCCMethodInvocationWithConditionalAsReceiverTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodInvocationWithParamAndReceiver'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCMethodInvocationWithConditionalAsReceiverTest >> methodInvocationWithParamAndReceiver [
	^ 'public void onClick(ClickEvent arg0) {
		(ratioDTO==null?"":"").method("");
	}'
]

{ #category : #running }
JavaSmaCCMethodInvocationWithConditionalAsReceiverTest >> setUp [
	super setUp.
	methodInvocationWithParamAndReceiver := (self
		parseMethod: 'InvocationWithParamAndReceiver') allFASTJavaMethodEntity first.
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithConditionalAsReceiverTest >> testClassPropertyReceiverMethodInvocations [
	self assert: methodInvocationWithParamAndReceiver statements first children anyOne receiver class equals: FASTJavaConditionalExpression
]
