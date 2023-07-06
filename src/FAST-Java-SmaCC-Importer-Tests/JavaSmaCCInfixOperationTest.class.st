Class {
	#name : #JavaSmaCCInfixOperationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCInfixOperationTest >> javaMethod [
	^ 'void infixOperationMethod() {
	if ((1 > 2) != true )
		return 4 + 5;
	}'
]

{ #category : #tests }
JavaSmaCCInfixOperationTest >> testInfixOperationLeftPartType [
	self assert: fastMethod statements first condition leftOperand leftOperand class equals: FASTJavaIntegerLiteral
]

{ #category : #tests }
JavaSmaCCInfixOperationTest >> testInfixOperationOperatorType [
	self assert: fastMethod statements first condition operator class equals: ByteString
]

{ #category : #tests }
JavaSmaCCInfixOperationTest >> testInfixOperationRightPartType [
	self assert: fastMethod statements first condition leftOperand rightOperand class equals: FASTJavaIntegerLiteral
]

{ #category : #tests }
JavaSmaCCInfixOperationTest >> testInfixOperationType [
	self assert: fastMethod statements first condition leftOperand class equals: FASTJavaInfixOperation
]
