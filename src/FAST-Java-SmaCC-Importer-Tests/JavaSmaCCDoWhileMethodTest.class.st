Class {
	#name : #JavaSmaCCDoWhileMethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'doWhile'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCDoWhileMethodTest >> methodDoWhile [
	
	^ 
'void doWhile() {
 	do {
      something();
   } while (ReactiveHelper.executeFromQueue());
}
'
]

{ #category : #running }
JavaSmaCCDoWhileMethodTest >> setUp [
	super setUp.
	doWhile := (self parseMethod: 'doWhile')
]

{ #category : #tests }
JavaSmaCCDoWhileMethodTest >> testDoWhileBodyParentNode [
	self assert: (doWhile allWithType: FASTJavaDoWhileStatement) first body parentNode equals: (doWhile allWithType: FASTJavaDoWhileStatement) first 
]

{ #category : #tests }
JavaSmaCCDoWhileMethodTest >> testDoWhileBodyType [
	self assert: (doWhile allWithType: FASTJavaDoWhileStatement) first body class equals: FASTJavaStatementBlock
]

{ #category : #tests }
JavaSmaCCDoWhileMethodTest >> testDoWhileConditionParentNode [
	self assert: (doWhile allWithType: FASTJavaDoWhileStatement) first condition parentNode equals: (doWhile allWithType: FASTJavaDoWhileStatement) first
]

{ #category : #tests }
JavaSmaCCDoWhileMethodTest >> testDoWhileInModelSize [
	self assert: (doWhile allWithType: FASTJavaDoWhileStatement) size equals: 1
]

{ #category : #tests }
JavaSmaCCDoWhileMethodTest >> testDoWhileParentNode [
	self assert: (doWhile allWithType: FASTJavaDoWhileStatement) first parentNode class equals: FASTJavaStatementBlock 
]
