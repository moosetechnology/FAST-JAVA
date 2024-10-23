Class {
	#name : 'JavaSmaCCCClassPropertyTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCCClassPropertyTest >> javaMethod [
	^ 'public void onClick(final ClickEvent event) {
	List<UnPojoMetierRHGWT> removedRowValues = new ArrayList<UnPojoMetierRHGWT>();
	removedRowValues.add(rowValue);
	((IEditableListModel)SampleCustomizableTableDefinitionRH.pListModel).deleteObjectModel(rowValue, true);
	SampleCustomizableTableDefinitionRH.editableTablelist.refreshAfterRemovingRow(removedRowValues);
}'
]

{ #category : 'tests' }
JavaSmaCCCClassPropertyTest >> testClassPropertyName [
	self assert: fastMethod statements asOrderedCollection fourth children anyOne receiver fieldName equals: 'editableTablelist'
]

{ #category : 'tests' }
JavaSmaCCCClassPropertyTest >> testClassPropertyType [
	self assert: fastMethod statements asOrderedCollection fourth children anyOne receiver class equals: FASTJavaClassProperty
]
