Class {
	#name : #JavaSmaCCReturnTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCReturnTest >> testIdentifierInModelSize [
	self assert: (fastModel allWithType: FASTJavaVariableExpression) size equals: 1
]

{ #category : #tests }
JavaSmaCCReturnTest >> testNamedEntityInModelSize [
	self assert: (fastModel allWithType: FASTJavaVariableExpression) size equals: 1
]
