Class {
	#name : #JavaSmaCCMethodCastTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodCastAndClassProperty'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCMethodCastTest >> methodCastAndClassProperty [
	^ 'public void onClick(final ClickEvent event) {
	List<UnPojoMetierRHGWT> removedRowValues = new ArrayList<UnPojoMetierRHGWT>();
	removedRowValues.add(rowValue);
	((IEditableListModel)SampleCustomizableTableDefinitionRH.pListModel).deleteObjectModel(rowValue, true);
	SampleCustomizableTableDefinitionRH.editableTablelist.refreshAfterRemovingRow(removedRowValues);
}'
]

{ #category : #running }
JavaSmaCCMethodCastTest >> setUp [
	super setUp.
	methodCastAndClassProperty := (self parseMethod: 'CastAndClassProperty')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCMethodCastTest >> testCastAsAReceiverOfAnInvocation [
	self assert: methodCastAndClassProperty statements third children anyOne receiver class equals: FASTJavaCastExpression
]

{ #category : #tests }
JavaSmaCCMethodCastTest >> testCastExpressionName [
	self assert: methodCastAndClassProperty statements third children anyOne receiver expression fieldName equals: 'pListModel'
]

{ #category : #tests }
JavaSmaCCMethodCastTest >> testCastExpressionType [
	self assert: methodCastAndClassProperty statements third children anyOne receiver expression class equals: FASTJavaClassProperty
]

{ #category : #tests }
JavaSmaCCMethodCastTest >> testCastType [
	self assert: methodCastAndClassProperty statements third children anyOne receiver type class equals: FASTJavaClassTypeExpression.
	self assert: methodCastAndClassProperty statements third children anyOne receiver type fullName equals: 'IEditableListModel'
]
