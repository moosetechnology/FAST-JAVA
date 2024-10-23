Class {
	#name : 'JavaSmaCCMethodCastTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMethodCastTest >> javaMethod [
	^ 'public void onClick(final ClickEvent event) {
	List<UnPojoMetierRHGWT> removedRowValues = new ArrayList<UnPojoMetierRHGWT>();
	removedRowValues.add(rowValue);
	((IEditableListModel)SampleCustomizableTableDefinitionRH.pListModel).deleteObjectModel(rowValue, true);
	SampleCustomizableTableDefinitionRH.editableTablelist.refreshAfterRemovingRow(removedRowValues);
}'
]

{ #category : 'tests' }
JavaSmaCCMethodCastTest >> testCastAsAReceiverOfAnInvocation [
	self assert: fastMethod statements third children anyOne receiver class equals: FASTJavaCastExpression
]

{ #category : 'tests' }
JavaSmaCCMethodCastTest >> testCastExpressionName [
	self assert: fastMethod statements third children anyOne receiver expression fieldName equals: 'pListModel'
]

{ #category : 'tests' }
JavaSmaCCMethodCastTest >> testCastExpressionType [
	self assert: fastMethod statements third children anyOne receiver expression class equals: FASTJavaClassProperty
]

{ #category : 'tests' }
JavaSmaCCMethodCastTest >> testCastType [
	self assert: fastMethod statements third children anyOne receiver type class equals: FASTJavaClassTypeExpression.
	self assert: fastMethod statements third children anyOne receiver type fullName equals: 'IEditableListModel'
]
