Class {
	#name : #JavaSmaCCAssertTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCAssertTest >> javaMethod [
	^ 'void assertMethod() {
		assert 1 == 3 || "hello" == "world" : "A message";
	}'
]

{ #category : #tests }
JavaSmaCCAssertTest >> testAssertNodeCondition [
	self assert: (fastModel allWithType: FASTJavaAssertStatement) anyOne condition class equals: FASTJavaInfixOperation
]

{ #category : #tests }
JavaSmaCCAssertTest >> testAssertNodeConditionParentNode [
	self assert: (fastModel allWithType: FASTJavaAssertStatement) anyOne condition parentNode equals: (fastModel allWithType: FASTJavaAssertStatement) anyOne
]

{ #category : #tests }
JavaSmaCCAssertTest >> testAssertNodeMessage [
	self assert: (fastModel allWithType: FASTJavaAssertStatement) anyOne message class equals: FASTJavaStringLiteral
]

{ #category : #tests }
JavaSmaCCAssertTest >> testAssertNodeMessageParentNode [
	self assert: (fastModel allWithType: FASTJavaAssertStatement) anyOne equals: (fastModel allWithType: FASTJavaAssertStatement) anyOne message parentNode
]

{ #category : #tests }
JavaSmaCCAssertTest >> testAssertNodeParentNode [
	self assert: (fastModel allWithType: FASTJavaAssertStatement) anyOne parentNode equals: (fastModel allWithType: FASTJavaStatementBlock) anyOne.
	self assert: (fastModel allWithType: FASTJavaAssertStatement) anyOne equals: (fastModel allWithType: FASTJavaStatementBlock) anyOne statements anyOne
]

{ #category : #tests }
JavaSmaCCAssertTest >> testNumberOfAssertNode [
	self assert: (fastModel allWithType: FASTJavaAssertStatement) size equals: 1
]
