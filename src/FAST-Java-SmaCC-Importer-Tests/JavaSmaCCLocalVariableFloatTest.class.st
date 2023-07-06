Class {
	#name : #JavaSmaCCLocalVariableFloatTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCLocalVariableFloatTest >> javaMethod [
	
	^ 'float aLittleOfVariables2() {
		float x = 5.5;	
		return x;
	}'
]

{ #category : #tests }
JavaSmaCCLocalVariableFloatTest >> testVariableDeclaratorExpressionParent2 [
	self
		assert: fastMethod statementBlock statements first declarators first expression parentNode
		equals: fastMethod statementBlock statements first declarators first
]

{ #category : #tests }
JavaSmaCCLocalVariableFloatTest >> testVariableDeclaratorExpressionType2 [
	self assert: fastMethod statementBlock statements first declarators first expression class equals: FASTJavaFloatLiteral
]

{ #category : #tests }
JavaSmaCCLocalVariableFloatTest >> testVariableDeclaratorExpressionValue2 [
	self assert: fastMethod statementBlock statements first declarators first expression primitiveValue equals: '5.5'
]
