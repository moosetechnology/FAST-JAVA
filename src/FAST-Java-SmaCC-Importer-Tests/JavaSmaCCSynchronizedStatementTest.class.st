Class {
	#name : #JavaSmaCCSynchronizedStatementTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'testElement'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #accessing }
JavaSmaCCSynchronizedStatementTest >> javaMethod [
	^ 'method() {
		synchronized(theInstance) { 
			theInstance.reset();
		}
}'
]

{ #category : #initialization }
JavaSmaCCSynchronizedStatementTest >> setUp [
	super setUp.

	testElement := (fastModel allWithType: FASTJavaSynchronizedStatement) first.

]

{ #category : #tests }
JavaSmaCCSynchronizedStatementTest >> testSynchronizedStatementExpressionParentNode [

	self assert: testElement expression parentNode equals: (fastModel allWithType: FASTJavaSynchronizedStatement) first.
]

{ #category : #tests }
JavaSmaCCSynchronizedStatementTest >> testSynchronizedStatementExpressionType [
	self assert: testElement expression class equals: FASTJavaVariableExpression .

]

{ #category : #tests }
JavaSmaCCSynchronizedStatementTest >> testSynchronizedStatementInModelSize [
	self assert: (fastModel allWithType: FASTJavaSynchronizedStatement) size equals: 1
]

{ #category : #tests }
JavaSmaCCSynchronizedStatementTest >> testSynchronizedStatementParentNode [
	self assert: testElement parentNode class equals: FASTJavaStatementBlock.
]

{ #category : #tests }
JavaSmaCCSynchronizedStatementTest >> testSynchronizedStatementType [
	self assert: testElement block class equals: FASTJavaStatementBlock.
]
