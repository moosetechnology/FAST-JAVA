Class {
	#name : 'JavaSmaCCTryWithResourceTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCTryWithResourceTest >> javaMethod [
	^ 'void tryCatch() {
	try (ACloseableType o = new ACloseableType()) {}
}'
]

{ #category : 'tests' }
JavaSmaCCTryWithResourceTest >> testDeclaredResourceOwner [

	| statement |
	statement := fastMethod statements anyOne.
	self assert: statement resources anyOne javaTryResourceOwner identicalTo: statement
]

{ #category : 'tests' }
JavaSmaCCTryWithResourceTest >> testExistingVariableResource [

	| statement resource |
	statement := self tryCatchStatementOf: 'void test(AutoCloseable existing) { try (existing) {} }'.
	resource := statement resources anyOne.
	self assert: resource class equals: FASTJavaVariableExpression.
	self assert: resource name equals: 'existing'.
	self assert: resource javaTryResourceOwner identicalTo: statement
]

{ #category : 'tests' }
JavaSmaCCTryWithResourceTest >> testFieldAccessResource [

	| statement resource |
	statement := self tryCatchStatementOf: 'void test() { try (this.stream) {} }'.
	resource := statement resources anyOne.
	self assert: resource class equals: FASTJavaFieldAccess.
	self assert: resource fieldName equals: 'stream'.
	self assert: resource javaTryResourceOwner identicalTo: statement
]

{ #category : 'tests' }
JavaSmaCCTryWithResourceTest >> testMultipleExistingVariableResources [

	| statement |
	statement := self tryCatchStatementOf: 'void test(AutoCloseable first, AutoCloseable second) { try (first; second) {} }'.
	self assert: statement resources size equals: 2.
	self assertCollection: (statement resources collect: [ :resource | resource name ]) hasSameElements: #( 'first' 'second' ).
	self assert: (statement resources allSatisfy: [ :resource | resource javaTryResourceOwner == statement ])
]

{ #category : 'tests' }
JavaSmaCCTryWithResourceTest >> testTryNoCatchPart [
	self assert: fastMethod statements anyOne catches size equals: 0
]

{ #category : 'tests' }
JavaSmaCCTryWithResourceTest >> testTryResourceNumber [
	self assert: fastMethod statements anyOne resources size equals: 1
]

{ #category : 'tests' }
JavaSmaCCTryWithResourceTest >> testTryResourcePartExpressionType [
	self assert: fastMethod statements anyOne resources anyOne declarators anyOne expression class equals: FASTJavaNewExpression 
]

{ #category : 'tests' }
JavaSmaCCTryWithResourceTest >> testTryResourcePartType [
	self assert: fastMethod statements anyOne resources anyOne class equals: FASTJavaVarDeclStatement
]

{ #category : 'tests' }
JavaSmaCCTryWithResourceTest >> testTryResourcePartTypeName [
	self assert: fastMethod statements anyOne resources anyOne type typeName name equals: 'ACloseableType'
]

{ #category : 'tests' }
JavaSmaCCTryWithResourceTest >> testTryResourcePartVariableName [
	self assert: fastMethod statements anyOne resources anyOne declarators anyOne variable name equals: 'o'
]

{ #category : 'tests' }
JavaSmaCCTryWithResourceTest >> testTryTryPartType [
	self assert: fastMethod statements anyOne try class equals: FASTJavaStatementBlock
]

{ #category : 'tests' }
JavaSmaCCTryWithResourceTest >> testTryType [
	self assert: fastMethod statements anyOne class equals: FASTJavaTryCatchStatement
]

{ #category : 'helpers' }
JavaSmaCCTryWithResourceTest >> tryCatchStatementOf: aMethodString [

	^ ((self parseMethodString: aMethodString) allWithType: FASTJavaTryCatchStatement) anyOne
]
