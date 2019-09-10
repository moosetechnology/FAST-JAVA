Class {
	#name : #JavaSmaCCSynchronizedStatementTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodSynchronizedStatement',
		'testElement'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCSynchronizedStatementTest >> methodSynchronizedStatement [
	^ 'method() {
		synchronized(theInstance) { 
			theInstance.reset();
		}
}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCSynchronizedStatementTest >> setUp [
	super setUp.
	methodSynchronizedStatement := (self parseMethod: 'synchronizedStatement').
	testElement := (methodSynchronizedStatement allWithType: FASTJavaSynchronizedStatement) first.

]

{ #category : #'as yet unclassified' }
JavaSmaCCSynchronizedStatementTest >> testSynchronizedStatementExpressionParentNode [
	self assert: testElement expression parentNode equals: (methodSynchronizedStatement allWithType: FASTJavaSynchronizedStatement) first.
]

{ #category : #'as yet unclassified' }
JavaSmaCCSynchronizedStatementTest >> testSynchronizedStatementExpressionType [
	self assert: testElement expression class equals: FASTJavaVariableExpression .

]

{ #category : #'as yet unclassified' }
JavaSmaCCSynchronizedStatementTest >> testSynchronizedStatementInModelSize [
	self assert: (methodSynchronizedStatement allWithType: FASTJavaSynchronizedStatement) size equals: 1
]

{ #category : #'as yet unclassified' }
JavaSmaCCSynchronizedStatementTest >> testSynchronizedStatementParentNode [
	self assert: testElement parentNode class equals: FASTStatementBlock.
]

{ #category : #'as yet unclassified' }
JavaSmaCCSynchronizedStatementTest >> testSynchronizedStatementType [
	self assert: testElement block class equals: FASTStatementBlock.
]
