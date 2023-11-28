Class {
	#name : #JavaSmaCCReturnAttributeAccessTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #accessing }
JavaSmaCCReturnAttributeAccessTest >> javaMethod [
	^ 'void methodReturn() {
		return a.b;
	}'
]

{ #category : #tests }
JavaSmaCCReturnAttributeAccessTest >> testReturnExpressionType [

	self
		assert: (fastModel allWithType: FASTJavaReturnStatement) anyOne expression class
		equals: FASTJavaQualifiedName 
]

{ #category : #tests }
JavaSmaCCReturnAttributeAccessTest >> testReturnStatementNumber [
	self assert: (fastModel allWithType: FASTJavaReturnStatement) size equals: 1
]
