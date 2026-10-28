Class {
	#name : 'JavaSmaCCColonFormSwitchExpressionTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCColonFormSwitchExpressionTest >> javaMethod [

	^ 'int newMethod() {
	int arrow = switch (inArrowForm) {
		case 1 -> 2;
		default -> 3;
	};
	return switch (inColonForm) {
		case 1: yield 2;
		default: yield 3;
	};
}'
]

{ #category : 'resources' }
JavaSmaCCColonFormSwitchExpressionTest >> switchOn: aVariableName [

	^ (fastModel allWithType: FASTJavaSwitchExpression) detect: [ :each | each condition name = aVariableName ]
]

{ #category : 'tests' }
JavaSmaCCColonFormSwitchExpressionTest >> testBlockInArrowFormStaysTheRulesOfTheExpression [
	"JLS 14.11.1: the two forms are alternatives, so an expression written in arrow form
	keeps its rules where they were and gains no cases."

	| switchExpression |
	switchExpression := self switchOn: 'inArrowForm'.
	self assert: switchExpression rules size equals: 2.
	self assert: switchExpression cases isEmpty
]

{ #category : 'tests' }
JavaSmaCCColonFormSwitchExpressionTest >> testBlockInColonFormBecomesTheCasesOfTheExpression [
	"JLS 14.11.1: a switch expression may write its block in colon form, where each group
	yields the value of the expression. SmaCC gives that block apart from the arrow rules,
	and it is the whole body of the expression, so reading only the rules leaves nothing."

	| switchExpression |
	switchExpression := self switchOn: 'inColonForm'.
	self assert: switchExpression cases size equals: 2.
	self assert: switchExpression rules isEmpty
]
