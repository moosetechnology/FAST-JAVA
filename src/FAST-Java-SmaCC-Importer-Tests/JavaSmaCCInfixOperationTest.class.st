Class {
	#name : #JavaSmaCCInfixOperationTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'infixOperationMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCInfixOperationTest >> methodInfixOperation [
	^ 'void infixOperationMethod() {
	if ((1 > 2) != true )
		return 4 + 5;
	}'
]

{ #category : #running }
JavaSmaCCInfixOperationTest >> setUp [
	super setUp.
	infixOperationMethod := (self parseMethod: 'InfixOperation') allFASTJavaMethodEntity
		first
]

{ #category : #tests }
JavaSmaCCInfixOperationTest >> testInfixOperationLeftPartType [
	self assert: infixOperationMethod statements first condition leftOperand leftOperand class equals: FASTJavaIntegerLiteral
]

{ #category : #tests }
JavaSmaCCInfixOperationTest >> testInfixOperationOperatorType [
	self assert: infixOperationMethod statements first condition operator class equals: ByteString
]

{ #category : #tests }
JavaSmaCCInfixOperationTest >> testInfixOperationRightPartType [
	self assert: infixOperationMethod statements first condition leftOperand rightOperand class equals: FASTJavaIntegerLiteral
]

{ #category : #tests }
JavaSmaCCInfixOperationTest >> testInfixOperationType [
	self assert: infixOperationMethod statements first condition leftOperand class equals: FASTJavaInfixOperation
]
