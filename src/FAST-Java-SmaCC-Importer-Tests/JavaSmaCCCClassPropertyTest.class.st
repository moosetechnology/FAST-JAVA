Class {
	#name : 'JavaSmaCCCClassPropertyTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
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
JavaSmaCCCClassPropertyTest >> testADottedNameCanBeAssignedTo [
	"A class property is the model's reading of a dotted name used as a value, and JLS 15.26
	lets one stand on the left of an assignment, so it is a variable expression and carries
	`FASTJavaTAssignable`. Taking that away silently drops 1322 of the 17631 files of JDK 8."

	| model assignment |
	model := self parseMethodString: 'void set() { Foo.bar = 1; }'.
	assignment := (model allWithType: FASTJavaAssignmentExpression) anyOne.
	self assert: assignment variable class equals: FASTJavaClassProperty.
	self assert: assignment variable javaVariableAssignmentOwner equals: assignment
]

{ #category : 'tests' }
JavaSmaCCCClassPropertyTest >> testClassPropertyName [

	self
		assert: fastMethod statements asOrderedCollection fourth containedEntities anyOne receiver fieldName
		equals: 'editableTablelist'
]

{ #category : 'tests' }
JavaSmaCCCClassPropertyTest >> testClassPropertyType [

	self
		assert: fastMethod statements asOrderedCollection fourth containedEntities anyOne receiver class
		equals: FASTJavaClassProperty
]
