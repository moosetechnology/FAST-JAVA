Class {
	#name : #JavaSmaCCConditionalStatementTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCConditionalStatementTest >> javaMethod [
	^ 'void arrayAccess() {
   int result = (1>2) ? 4 :  5;
}'
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalContidionParent [
	self assert: fastMethod statements anyOne declarators anyOne expression condition parentNode equals: fastMethod statements anyOne declarators anyOne expression 
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalContidionType [
	self assert: fastMethod statements anyOne declarators anyOne expression condition class equals: FASTJavaInfixOperation 
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalElsePartParent [
	self assert: fastMethod statements anyOne declarators anyOne expression elsePart parentNode equals: fastMethod statements anyOne declarators anyOne expression
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalElsePartType [
	self assert: fastMethod statements anyOne declarators anyOne expression elsePart class equals: FASTJavaIntegerLiteral
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalParent [ 
	self assert: fastMethod statements anyOne declarators anyOne expression parentNode equals: fastMethod statements anyOne declarators anyOne 
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalSize [
	self assert: (fastMethod mooseModel allWithType: FASTJavaConditionalExpression) size equals: 1 
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalThenPartParent [
	self assert: fastMethod statements anyOne declarators anyOne expression thenPart parentNode equals: fastMethod statements anyOne declarators anyOne expression
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalThenPartType [
	self assert: fastMethod statements anyOne declarators anyOne expression thenPart class equals: FASTJavaIntegerLiteral 
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalType [
	self assert: fastMethod statements anyOne declarators anyOne expression class equals: FASTJavaConditionalExpression 
]
