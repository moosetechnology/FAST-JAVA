Class {
	#name : 'JavaSmaCCSwitchNullAndDefaultTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCSwitchNullAndDefaultTest >> javaClass [

	^ 'class Labels {

	void colon(Object o) {
		switch (o) {
			case null, default:
				break;
		}
	}

	void arrow(Object o) {
		switch (o) {
			case null, default -> { }
		}
	}
}'
]

{ #category : 'tests' }
JavaSmaCCSwitchNullAndDefaultTest >> testArrowLabelOverNullAlsoCoversTheDefault [
	"JLS 14.11.1: `case null, default ->` writes null as its one constant and the default
	beside it."

	| label |
	label := (fastModel allWithType: FASTJavaSwitchRule) anyOne label.

	self assert: label isDefault.
	self assert: label caseExpressions size equals: 1.
	self assert: label caseExpressions anyOne class equals: FASTJavaNullLiteral
]

{ #category : 'tests' }
JavaSmaCCSwitchNullAndDefaultTest >> testColonLabelOverNullAlsoCoversTheDefault [
	"JLS 14.11.1: `case null, default:` writes null as its one constant and the default
	beside it, rather than instead of it."

	| label |
	label := (fastModel allWithType: FASTJavaSwitchLabel)
		         detect: [ :each | each switchRuleOwner isNil ].

	self assert: label isDefault.
	self assert: label caseExpressions size equals: 1.
	self assert: label caseExpressions anyOne class equals: FASTJavaNullLiteral
]

{ #category : 'tests' }
JavaSmaCCSwitchNullAndDefaultTest >> testLabelOverConstantsAloneIsNotTheDefault [

	| model label |
	model := self parseClassString: 'class Labels { void m(int i) { switch (i) { case 1, 2: break; } } }'.
	label := (model allWithType: FASTJavaSwitchLabel) anyOne.

	self deny: label isDefault.
	self assert: label caseExpressions size equals: 2
]

{ #category : 'tests' }
JavaSmaCCSwitchNullAndDefaultTest >> testLabelWritingDefaultAloneIsTheDefault [
	"JLS 14.11.1: a label that writes `default` and nothing else writes no constant, which
	is how the model has always told the default apart."

	| model label |
	model := self parseClassString: 'class Labels { void m(int i) { switch (i) { default: break; } } }'.
	label := (model allWithType: FASTJavaSwitchLabel) anyOne.

	self assert: label isDefault.
	self assert: label caseExpressions isEmpty
]
