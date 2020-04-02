Class {
	#name : #JavaSmaCCReturnTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodSuperConstructor',
		'superMethodInvocation',
		'methodReturn'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCReturnTest >> methodReturn [
	^ 'int methodReturn(int i) {
		return i;
	}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCReturnTest >> setUp [
	super setUp.
	methodReturn := (self parseMethod: 'return')
]

{ #category : #tests }
JavaSmaCCReturnTest >> testIdentifierInModelSize [
	self assert: (methodReturn allWithType: FASTJavaVariableExpression) size equals: 1
]

{ #category : #tests }
JavaSmaCCReturnTest >> testNamedEntityInModelSize [
	self assert: (methodReturn allWithType: FASTJavaVariableExpression) size equals: 1
]
