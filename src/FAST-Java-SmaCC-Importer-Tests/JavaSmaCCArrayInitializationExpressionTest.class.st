Class {
	#name : #JavaSmaCCArrayInitializationExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodArrayInitializationExpression'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCArrayInitializationExpressionTest >> methodArrayInitializationExpression [
	^ 'void arrayAccess() {
		Veggies veggies[] = { new BlackOlives(), 
		                      new Spinach(), 
		                      new Eggplant() };
}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayInitializationExpressionTest >> setUp [
	super setUp.
	methodArrayInitializationExpression := (self parseMethod: 'ArrayInitializationExpression')
]

{ #category : #'as yet unclassified' }
JavaSmaCCArrayInitializationExpressionTest >> testNumberOfInitializedElement [
	self assert: (methodArrayInitializationExpression allWithType: FASTJavaNewExpression) size equals: 3 
]
