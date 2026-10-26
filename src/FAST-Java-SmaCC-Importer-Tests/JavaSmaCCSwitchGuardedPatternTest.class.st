"
I check that the guard a case label writes after its pattern is imported as the expression of that label (JLS 14.11.1).
"
Class {
	#name : 'JavaSmaCCSwitchGuardedPatternTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCSwitchGuardedPatternTest >> javaMethod [

	^ 'void f(Object obj) {
	switch (obj) {
		case Integer i when i > 0 -> first(i);
		case Integer i -> second(i);
		default -> last();
	}
}'
]

{ #category : 'accessing' }
JavaSmaCCSwitchGuardedPatternTest >> rules [

	^ (fastModel allWithType: FASTJavaSwitchStatement) anyOne rules
]

{ #category : 'tests' }
JavaSmaCCSwitchGuardedPatternTest >> testGuardIsTheExpressionWritten [

	self assert: self rules first label guard operator equals: '>'
]

{ #category : 'tests' }
JavaSmaCCSwitchGuardedPatternTest >> testGuardReadsTheVariableThePatternDeclares [

	self assert: self rules first label guard leftOperand name equals: 'i'
]

{ #category : 'tests' }
JavaSmaCCSwitchGuardedPatternTest >> testGuardedLabelKeepsItsPattern [

	self assert: self rules first label caseExpressions anyOne type typeName name equals: 'Integer'
]

{ #category : 'tests' }
JavaSmaCCSwitchGuardedPatternTest >> testLabelWithoutGuardHasNone [

	self assert: self rules second label guard isNil.
	self assert: self rules third label guard isNil
]
