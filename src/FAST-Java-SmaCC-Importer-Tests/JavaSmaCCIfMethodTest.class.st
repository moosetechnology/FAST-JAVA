Class {
	#name : 'JavaSmaCCIfMethodTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCIfMethodTest >> javaMethod [
	^ 'void ifMethod() {
	if (true)
		return 4 + 5;
	if (false)
		{ int x = 2;	x = x + 3; }
		else 
			return 5 + 4;
	}'
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testFirstIfConditionParent [
	self assert: fastMethod statements first condition parentNode equals: fastMethod statements first
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testFirstIfConditionType [
	self assert: fastMethod statements first condition class equals: FASTJavaBooleanLiteral
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testFirstIfElseAbsence [
	self assert: fastMethod statements first elsePart isNil 
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testFirstIfThenParent [
	self assert: fastMethod statements first thenPart parentNode equals: fastMethod statements first
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testFirstIfThenType [
	self assert: fastMethod statements first thenPart class equals: FASTJavaReturnStatement 
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testFirstSecondConditionParent [
	self assert: fastMethod statements last condition parentNode equals: fastMethod statements last 
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testFirstSecondConditionType [
	self assert: fastMethod statements last condition class equals: FASTJavaBooleanLiteral
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testSecondIfElseParent [
	self assert: fastMethod statements last elsePart parentNode equals: fastMethod statements last
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testSecondIfElseType [
	self assert: fastMethod statements last elsePart class equals: FASTJavaReturnStatement
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testSecondIfThenParent [
	self assert: fastMethod statements last thenPart parentNode equals: fastMethod statements last 
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testSecondIfThenType [
	self assert: fastMethod statements last thenPart class equals: FASTJavaStatementBlock 
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testStatementsCount [
	self assert: fastMethod statements size equals: 2
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testStatementsParent [
	self
		assert: fastMethod statements first parentNode equals: fastMethod statementBlock;
		assert: fastMethod statements last  parentNode equals: fastMethod statementBlock;
		assert: fastMethod statementBlock parentNode equals: fastMethod 
]

{ #category : 'tests' }
JavaSmaCCIfMethodTest >> testStatementsType [
	self
		assert: fastMethod statements first class equals: FASTJavaIfStatement;
		assert: fastMethod statements last class equals: FASTJavaIfStatement
]
