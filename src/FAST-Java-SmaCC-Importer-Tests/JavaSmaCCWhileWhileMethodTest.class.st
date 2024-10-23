Class {
	#name : 'JavaSmaCCWhileWhileMethodTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCWhileWhileMethodTest >> javaMethod [
	
	^ 
'void whileWhile() {
  boolean a = false;	
  while (true) { 
    int b = 5;
  }
  while (4 > 5) { 
    while (false)
      a = false;
    int b = 6;
  }
  boolean b = true;
  return b;
}
'
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testFirstWhileBodyParent [
	self assert: fastMethod statements second body parentNode equals: fastMethod statements second
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testFirstWhileBodyType [
	self assert: fastMethod statements second body class equals: FASTJavaStatementBlock 
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testFirstWhileConditionParent [
	self assert: fastMethod statements second condition parentNode equals: fastMethod statements second
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testFirstWhileConditionType [
	self assert: fastMethod statements second condition class equals: FASTJavaBooleanLiteral
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testNestedWhileBodyContentType [
	self assert: fastMethod statements third body statements first body children anyOne class equals: FASTJavaAssignmentExpression
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testNestedWhileBodyParent [
	self assert: fastMethod statements third body statements first body parentNode equals: fastMethod statements third body statements first 
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testNestedWhileBodyType [
	self assert: fastMethod statements third body statements first body class equals: FASTJavaExpressionStatement
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testNestedWhileConditionParent [
	self assert: fastMethod statements third body statements first condition parentNode equals: fastMethod statements third body statements first 
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testNestedWhileConditionType [
	
	self assert: fastMethod statements third body statements first condition class equals: FASTJavaBooleanLiteral
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testSecondWhileBodyParent [
	self assert: fastMethod statements third body parentNode equals: fastMethod statements third 
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testSecondWhileBodyType [
	self assert: fastMethod statements third body class equals: FASTJavaStatementBlock 
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testSecondWhileConditionParent [
	self assert: fastMethod statements third condition parentNode equals: fastMethod statements third 
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testSecondWhileConditionType [
	self assert: fastMethod statements third condition class equals: FASTJavaInfixOperation
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testStatementsCount [
	self assert: fastMethod statements size equals: 5
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testStatementsParent [
	fastMethod statements do: [ :each | self assert: each parentNode equals: fastMethod statementBlock ]
]

{ #category : 'tests' }
JavaSmaCCWhileWhileMethodTest >> testStatementsType [
	self
		assert: fastMethod statements first class equals: FASTJavaVarDeclStatement;
		assert: fastMethod statements second class equals: FASTJavaWhileStatement;
		assert: fastMethod statements third class equals: FASTJavaWhileStatement;
		assert: (fastMethod statements at: 4) class equals: FASTJavaVarDeclStatement;
		assert: fastMethod statements last class equals: FASTJavaReturnStatement
]
