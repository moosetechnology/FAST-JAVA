Class {
	#name : 'JavaSmaCCDoWhileMethodTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCDoWhileMethodTest >> javaMethod [
	
	^ 
'void doWhile() {
 	do {
      something();
   } while (ReactiveHelper.executeFromQueue());
}
'
]

{ #category : 'tests' }
JavaSmaCCDoWhileMethodTest >> testDoWhileBodyParentNode [
	self assert: (fastModel allWithType: FASTJavaDoWhileStatement) first body parentNode equals: (fastModel allWithType: FASTJavaDoWhileStatement) first 
]

{ #category : 'tests' }
JavaSmaCCDoWhileMethodTest >> testDoWhileBodyType [
	self assert: (fastModel allWithType: FASTJavaDoWhileStatement) first body class equals: FASTJavaStatementBlock
]

{ #category : 'tests' }
JavaSmaCCDoWhileMethodTest >> testDoWhileConditionParentNode [
	self assert: (fastModel allWithType: FASTJavaDoWhileStatement) first condition parentNode equals: (fastModel allWithType: FASTJavaDoWhileStatement) first
]

{ #category : 'tests' }
JavaSmaCCDoWhileMethodTest >> testDoWhileInModelSize [
	self assert: (fastModel allWithType: FASTJavaDoWhileStatement) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCDoWhileMethodTest >> testDoWhileParentNode [
	self assert: (fastModel allWithType: FASTJavaDoWhileStatement) first parentNode class equals: FASTJavaStatementBlock 
]
