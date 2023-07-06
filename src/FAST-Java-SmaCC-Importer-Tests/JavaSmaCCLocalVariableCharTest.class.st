Class {
	#name : #JavaSmaCCLocalVariableCharTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCLocalVariableCharTest >> javaMethod [
	
	^ 'char aLittleOfVariables3() {
		char x = ''c'';	
		return x;
	}'
]

{ #category : #tests }
JavaSmaCCLocalVariableCharTest >> testVariableDeclaratorExpressionParent3 [
	self
		assert: fastMethod statementBlock statements first declarators first expression parentNode
		equals: fastMethod statementBlock statements first declarators first
]

{ #category : #tests }
JavaSmaCCLocalVariableCharTest >> testVariableDeclaratorExpressionType3 [
	self assert: fastMethod statementBlock statements first declarators first expression class equals: FASTJavaCharacterLiteral
]

{ #category : #tests }
JavaSmaCCLocalVariableCharTest >> testVariableDeclaratorExpressionValue3 [
	self assert: fastMethod statementBlock statements first declarators first expression primitiveValue equals: '''c'''
]
