Class {
	#name : 'JavaSmaCCSwitchLabelsTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCSwitchLabelsTest >> casesOfSwitchOn: aVariableName [

	^ ((fastModel allWithType: FASTJavaSwitchStatement) detect: [ :each | each condition name = aVariableName ]) cases
		  asOrderedCollection
]

{ #category : 'resources' }
JavaSmaCCSwitchLabelsTest >> javaMethod [

	^ 'void newMethod() {
	switch (shared) {
		default: case 0: handle(); break;
		case 1: other(); break;
	}
	switch (trailing) {
		case 2: last(); break;
		default:
	}
}'
]

{ #category : 'tests' }
JavaSmaCCSwitchLabelsTest >> testGroupKeepsEveryLabelWrittenBeforeItsStatements [
	"JLS 14.11: a group may be entered through several labels, and the default is one of
	them like any other. Keeping only the first loses an entry into the group."

	| labels |
	labels := (self casesOfSwitchOn: 'shared') first labels asOrderedCollection.
	self assert: labels size equals: 2.
	self assert: labels first caseExpressions isEmpty.
	self
		assert: (labels second caseExpressions asOrderedCollection collect: [ :each | each primitiveValue ]) asArray
		equals: #( '0' )
]

{ #category : 'tests' }
JavaSmaCCSwitchLabelsTest >> testLabelFollowedByNoStatementIsKeptAsACaseOfItsOwn [
	"JLS 14.11: a switch block may end with labels that no statement follows. They say
	where control may enter the block, so dropping them changes which values fall through
	to the end rather than matching nothing at all."

	| cases last |
	cases := self casesOfSwitchOn: 'trailing'.
	self assert: cases size equals: 2.
	last := cases second.
	self assert: last class equals: FASTJavaDefaultCaseStatement.
	self assert: last labels size equals: 1.
	self assert: last statements isEmpty
]
