Class {
	#name : #JavaSmaCCNewClassAffectedTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCNewClassAffectedTest >> testDeclaredMethodSize [
	self assert: (fastModel allWithType: FASTJavaNewClassExpression) anyOne declarations size equals: 2
]

{ #category : #tests }
JavaSmaCCNewClassAffectedTest >> testNewName [
	self assert: (fastModel allWithType: FASTJavaNewClassExpression) anyOne type fullName equals: 'Patate'
]

{ #category : #tests }
JavaSmaCCNewClassAffectedTest >> testNewParent [

	self
		assert:
		(fastModel allWithType: FASTJavaNewClassExpression) anyOne
			parentNode
		equals:
			(fastModel detect: [ :entity | entity mooseName = 'newMethod' ])
				statements anyOne
]

{ #category : #tests }
JavaSmaCCNewClassAffectedTest >> testNumberOfMethod [
	self assert: fastModel allFASTJavaMethodEntity size equals: 3
]

{ #category : #tests }
JavaSmaCCNewClassAffectedTest >> testNumberOfNewClass [
	self
		assert: (fastModel allWithType: FASTJavaNewClassExpression) size
		equals: 1
]
