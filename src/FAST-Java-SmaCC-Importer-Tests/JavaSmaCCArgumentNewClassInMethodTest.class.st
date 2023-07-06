Class {
	#name : #JavaSmaCCArgumentNewClassInMethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCArgumentNewClassInMethodTest >> testDeclaredMethodSize [
	self assert: (fastModel allWithType: FASTJavaNewClassExpression) anyOne declarations size equals: 2
]

{ #category : #tests }
JavaSmaCCArgumentNewClassInMethodTest >> testNewName [
	self assert: (fastModel allWithType: FASTJavaNewClassExpression) anyOne type fullName equals: 'Patate'
]

{ #category : #tests }
JavaSmaCCArgumentNewClassInMethodTest >> testNewParent [
	self assert: (fastModel allWithType: FASTJavaNewClassExpression) anyOne parentNode equals: (fastModel allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : #tests }
JavaSmaCCArgumentNewClassInMethodTest >> testNewParentChildren [
	self assert: (fastModel allWithType: FASTJavaNewClassExpression) anyOne equals: (fastModel allWithType: FASTJavaMethodInvocation) anyOne arguments anyOne
]

{ #category : #tests }
JavaSmaCCArgumentNewClassInMethodTest >> testNumberOfMethod [
	self assert: fastModel allFASTJavaMethodEntity size equals: 3
]
