Class {
	#name : #JavaSmaCCMethodInvocationWithParamAndReceiverTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodInvocationWithClassPropertyAsReceiver',
		'methodInvocationWithParamAndReceiver',
		'methodInvocationWithVariableAsReceiver'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> methodInvocationWithClassPropertyAsReceiver [
	^ 'public void onClick(final ClickEvent event) {
	SampleCustomizableTableDefinitionRH.editableTablelist.refreshAfterRemovingRow(removedRowValues);
}'
]

{ #category : #resources }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> methodInvocationWithParamAndReceiver [
	^ 'public void onClick(ClickEvent arg0) {
		x = hello(a,b).hello2(1,2);
	}'
]

{ #category : #resources }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> methodInvocationWithVariableAsReceiver [
	^ 'public void onClick(final ClickEvent event) {
	editableTablelist.refreshAfterRemovingRow(removedRowValues);
}'
]

{ #category : #running }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> setUp [
	super setUp.
	methodInvocationWithParamAndReceiver := (self
		parseMethod: 'InvocationWithParamAndReceiver') allFASTJavaMethodEntity first.
	methodInvocationWithVariableAsReceiver := (self
		parseMethod: 'InvocationWithVariableAsReceiver') allFASTJavaMethodEntity first.
	methodInvocationWithClassPropertyAsReceiver := (self
		parseMethod: 'InvocationWithClassPropertyAsReceiver') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testClassPropertyReceiverMethodInvocations [
	self assert: methodInvocationWithClassPropertyAsReceiver statements first children anyOne receiver class equals: FASTJavaClassProperty
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testNumberOfArguments [
	self assert: methodInvocationWithParamAndReceiver statementBlock children anyOne children anyOne expression arguments size equals: 2.
	self assert: methodInvocationWithParamAndReceiver statementBlock children anyOne children anyOne expression receiver arguments size equals: 2
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testNumberOfMethodInvocations [
	self assert: methodInvocationWithParamAndReceiver statementBlock children anyOne children anyOne expression class equals: FASTJavaMethodInvocation.
	self assert: methodInvocationWithParamAndReceiver statementBlock children anyOne children anyOne expression receiver class equals: FASTJavaMethodInvocation.
	self assert: methodInvocationWithParamAndReceiver statementBlock children anyOne children anyOne expression receiver receiver equals: nil
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testReceiverIsInModel [
	self
		assert: methodInvocationWithVariableAsReceiver statements first children anyOne receiver localMooseModel
		equals: methodInvocationWithVariableAsReceiver localMooseModel
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testReceiverKnowTheCallingMethod [
	self
		assert: methodInvocationWithVariableAsReceiver statements first children anyOne receiver parentNode
		equals: methodInvocationWithVariableAsReceiver statements first children anyOne
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testReceiverMethodInvocations [
	self assert: methodInvocationWithParamAndReceiver statementBlock children anyOne children anyOne expression receiver class equals: FASTJavaMethodInvocation.
	self assert: methodInvocationWithParamAndReceiver statementBlock children anyOne children anyOne expression receiver receiver equals: nil.
	self assert: methodInvocationWithVariableAsReceiver statements first children anyOne receiver class equals: FASTJavaIdentifier
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testTypeOfArguments [
	self
		assert: methodInvocationWithParamAndReceiver statementBlock children anyOne children anyOne expression arguments first class
		equals: FASTJavaIntegerLiteral.
	self
		assert: methodInvocationWithParamAndReceiver statementBlock children anyOne children anyOne expression arguments second class
		equals: FASTJavaIntegerLiteral
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testVariableReceiverMethodInvocations [
	self assert: methodInvocationWithVariableAsReceiver statements first children anyOne receiver class equals: FASTJavaIdentifier
]
