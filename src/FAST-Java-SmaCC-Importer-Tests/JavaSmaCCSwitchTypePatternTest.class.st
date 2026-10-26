"
I check that a case label writing a type pattern is imported as one (JLS 14.11.1), in a switch written with arrows and in a switch written with colons.
"
Class {
	#name : 'JavaSmaCCSwitchTypePatternTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCSwitchTypePatternTest >> arrowLabelPattern [

	^ ((fastModel allWithType: FASTJavaSwitchStatement) detect: [ :each | each rules isNotEmpty ])
		  rules first label caseExpressions anyOne
]

{ #category : 'accessing' }
JavaSmaCCSwitchTypePatternTest >> colonLabelPattern [

	^ ((fastModel allWithType: FASTJavaSwitchStatement) detect: [ :each | each cases isNotEmpty ])
		  cases first labels first caseExpressions anyOne
]

{ #category : 'accessing' }
JavaSmaCCSwitchTypePatternTest >> javaMethod [

	^ 'void f(Object obj) {
	switch (obj) {
		case Integer i -> first(i);
		default -> last();
	}
	switch (obj) {
		case String s: second(s); break;
		default: last();
	}
}'
]

{ #category : 'tests' }
JavaSmaCCSwitchTypePatternTest >> testArrowLabelPatternType [

	self assert: self arrowLabelPattern type typeName name equals: 'Integer'
]

{ #category : 'tests' }
JavaSmaCCSwitchTypePatternTest >> testArrowLabelPatternVariable [

	self assert: self arrowLabelPattern variable name equals: 'i'
]

{ #category : 'tests' }
JavaSmaCCSwitchTypePatternTest >> testColonLabelPatternType [

	self assert: self colonLabelPattern type typeName name equals: 'String'
]

{ #category : 'tests' }
JavaSmaCCSwitchTypePatternTest >> testColonLabelPatternVariable [

	self assert: self colonLabelPattern variable name equals: 's'
]

{ #category : 'tests' }
JavaSmaCCSwitchTypePatternTest >> testTypePatternCount [

	self assert: (fastModel allWithType: FASTJavaTypePattern) size equals: 2
]
