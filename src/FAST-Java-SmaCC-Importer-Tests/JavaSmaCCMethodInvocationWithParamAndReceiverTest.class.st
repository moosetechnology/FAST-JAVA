Class {
	#name : #JavaSmaCCMethodInvocationWithParamAndReceiverTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodInvocationWithClassPropertyAsReceiver',
		'methodInvocationWithVariableAsReceiver'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> javaMethod [
	^ 'public void onClick(ClickEvent arg0) {
		x = hello(a,b).hello2(1,2);
	}'
]

{ #category : #resources }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> methodInvocationWithClassPropertyAsReceiver [
	^ 'public void onClick(final ClickEvent event) {
	SampleCustomizableTableDefinitionRH.editableTablelist.refreshAfterRemovingRow(removedRowValues);
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

	fastModel := (self
		parseMethodString: self javaMethod) allFASTJavaMethodEntity first.
	methodInvocationWithVariableAsReceiver := (self
		parseMethodString: self methodInvocationWithVariableAsReceiver) allFASTJavaMethodEntity first.
	methodInvocationWithClassPropertyAsReceiver := (self
		parseMethodString: self methodInvocationWithClassPropertyAsReceiver) allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testClassPropertyReceiverMethodInvocations [
	self assert: methodInvocationWithClassPropertyAsReceiver statements first children anyOne receiver class equals: FASTJavaClassProperty
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testNumberOfArguments [
	self assert: fastModel statementBlock children anyOne children anyOne expression arguments size equals: 2.
	self assert: fastModel statementBlock children anyOne children anyOne expression receiver arguments size equals: 2
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testNumberOfMethodInvocations [
	self assert: fastModel statementBlock children anyOne children anyOne expression class equals: FASTJavaMethodInvocation.
	self assert: fastModel statementBlock children anyOne children anyOne expression receiver class equals: FASTJavaMethodInvocation.
	self assert: fastModel statementBlock children anyOne children anyOne expression receiver receiver equals: nil
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
	self assert: fastModel statementBlock children anyOne children anyOne expression receiver class equals: FASTJavaMethodInvocation.
	self assert: fastModel statementBlock children anyOne children anyOne expression receiver receiver equals: nil.
	self assert: methodInvocationWithVariableAsReceiver statements first children anyOne receiver class equals: FASTJavaIdentifier
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testTypeOfArguments [
	self
		assert: fastModel statementBlock children anyOne children anyOne expression arguments first class
		equals: FASTJavaIntegerLiteral.
	self
		assert: fastModel statementBlock children anyOne children anyOne expression arguments second class
		equals: FASTJavaIntegerLiteral
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testVariableReceiverMethodInvocations [
	self assert: methodInvocationWithVariableAsReceiver statements first children anyOne receiver class equals: FASTJavaIdentifier
]
