Class {
	#name : #JavaSmaCCReturnTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #accessing }
JavaSmaCCReturnTest >> javaMethod [
	^ 'int methodReturn(int i) {
		return i;
	}'
]

{ #category : #tests }
JavaSmaCCReturnTest >> testIdentifierInModelSize [
	self assert: (fastModel allWithType: FASTJavaVariableExpression) size equals: 2
]

{ #category : #tests }
JavaSmaCCReturnTest >> testParameterName [
	self
		assert: (fastModel allWithType: FASTJavaParameter) anyOne variable name
		equals: 'i'
]

{ #category : #tests }
JavaSmaCCReturnTest >> testParameterNumber [
	self assert: (fastModel allWithType: FASTJavaParameter) size equals: 1
]

{ #category : #tests }
JavaSmaCCReturnTest >> testReturnExpressionType [
	self
		assert: (fastModel allWithType: FASTJavaReturnStatement) anyOne expression class
		equals: FASTJavaVariableExpression
]

{ #category : #tests }
JavaSmaCCReturnTest >> testReturnStatementNumber [
	self
		assert: (fastModel allWithType: FASTJavaReturnStatement) size
		equals: 1
]

{ #category : #tests }
JavaSmaCCReturnTest >> testReturnVariableName [
	self
		assert: (fastModel allWithType: FASTJavaReturnStatement) anyOne expression name
		equals: 'i'
]
