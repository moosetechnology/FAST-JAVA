Class {
	#name : 'JavaSmaCCQualifiedNameTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCQualifiedNameTest >> javaMethod [
	^ 'public void onClick(final ClickEvent event) {
	List<UnPojoMetierRHGWT> removedRowValues = new ArrayList<UnPojoMetierRHGWT>();
	removedRowValues.add(rowValue);
	((IEditableListModel)SampleCustomizableTableDefinitionRH.pListModel).deleteObjectModel(rowValue, true);
	SampleCustomizableTableDefinitionRH.editableTablelist.refreshAfterRemovingRow(removedRowValues);
}'
]

{ #category : 'tests' }
JavaSmaCCQualifiedNameTest >> testAClassLiteralIsNotAName [
	"JLS 15.8.2: `String.class` reads the Class object of a type. It is not a dotted name:
	what stands before the dot is a type, and nothing assigns to it."

	| model literal |
	model := self parseMethodString: 'void m() { Class<?> a = String.class; Class<?> b = int[].class; }'.
	self assert: (model allWithType: FASTJavaClassLiteral) size equals: 2.
	self assert: (model allWithType: FASTJavaQualifiedName) isEmpty.
	literal := (model allWithType: FASTJavaClassLiteral) detect: [ :each | each type isClassTypeExpression ].
	self deny: (literal isKindOf: FASTJavaVariableExpression)
]

{ #category : 'tests' }
JavaSmaCCQualifiedNameTest >> testADottedNameCanBeAssignedTo [
	"JLS 6.5: a dotted name is ambiguous until it is resolved, so it is read as the name it
	is written as. JLS 15.26 lets one stand on the left of an assignment, which is why a
	qualified name carries `FASTJavaTAssignable`."

	| model assignment |
	model := self parseMethodString: 'void set() { Foo.bar = 1; }'.
	assignment := (model allWithType: FASTJavaAssignmentExpression) anyOne.
	self assert: assignment variable class equals: FASTJavaQualifiedName.
	self assert: assignment variable javaVariableAssignmentOwner equals: assignment
]

{ #category : 'tests' }
JavaSmaCCQualifiedNameTest >> testADottedNameIsAQualifiedName [

	self
		assert: fastMethod statements asOrderedCollection fourth containedEntities anyOne receiver class
		equals: FASTJavaQualifiedName
]

{ #category : 'tests' }
JavaSmaCCQualifiedNameTest >> testEveryClassLiteralNamesAType [
	"JLS 15.8.2: the type of a class literal may be a class, an array, a primitive type or
	`void`, and never anything that is not a type."

	| model |
	model := self parseMethodString: 'void m() { Object a = void.class; Object b = boolean.class; Object c = String.class; }'.
	self assert: ((model allWithType: FASTJavaClassLiteral) allSatisfy: [ :each | each type isKindOf: FASTJavaTypeExpression ])
]

{ #category : 'tests' }
JavaSmaCCQualifiedNameTest >> testQualifiedNameLastPart [

	self
		assert: fastMethod statements asOrderedCollection fourth containedEntities anyOne receiver name
		equals: 'editableTablelist'
]
