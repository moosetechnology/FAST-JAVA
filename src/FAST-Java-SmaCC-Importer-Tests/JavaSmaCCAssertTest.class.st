Class {
	#name : #JavaSmaCCAssertTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'assertMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCAssertTest >> methodAssertMethod [
	^ 'void assertMethod() {
		assert 1 == 3 || "hello" == "world" : "A message";
	}'
]

{ #category : #running }
JavaSmaCCAssertTest >> setUp [
	super setUp.
	assertMethod := (self parseMethod: 'assertMethod')
]

{ #category : #tests }
JavaSmaCCAssertTest >> testAssertNodeCondition [
	self assert: (assertMethod allWithType: FASTJavaAssertStatement) anyOne condition class equals: FASTJavaInfixOperation
]

{ #category : #tests }
JavaSmaCCAssertTest >> testAssertNodeConditionParentNode [
	self assert: (assertMethod allWithType: FASTJavaAssertStatement) anyOne condition parentNode equals: (assertMethod allWithType: FASTJavaAssertStatement) anyOne
]

{ #category : #tests }
JavaSmaCCAssertTest >> testAssertNodeMessage [
	self assert: (assertMethod allWithType: FASTJavaAssertStatement) anyOne message class equals: FASTJavaStringLiteral
]

{ #category : #tests }
JavaSmaCCAssertTest >> testAssertNodeMessageParentNode [
	self assert: (assertMethod allWithType: FASTJavaAssertStatement) anyOne equals: (assertMethod allWithType: FASTJavaAssertStatement) anyOne message parentNode
]

{ #category : #tests }
JavaSmaCCAssertTest >> testAssertNodeParentNode [
	self assert: (assertMethod allWithType: FASTJavaAssertStatement) anyOne parentNode equals: (assertMethod allWithType: FASTJavaStatementBlock) anyOne.
	self assert: (assertMethod allWithType: FASTJavaAssertStatement) anyOne equals: (assertMethod allWithType: FASTJavaStatementBlock) anyOne statements anyOne
]

{ #category : #tests }
JavaSmaCCAssertTest >> testNumberOfAssertNode [
	self assert: (assertMethod allWithType: FASTJavaAssertStatement) size equals: 1
]
