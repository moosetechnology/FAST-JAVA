Class {
	#name : #JavaSmaCCArrayInitializationExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCArrayInitializationExpressionTest >> javaMethod [
	^ 'void arrayAccess() {
		Veggies veggies[] = { new BlackOlives(), 
		                      new Spinach(), 
		                      new Eggplant() };
}'
]

{ #category : #tests }
JavaSmaCCArrayInitializationExpressionTest >> testNumberOfInitializedElement [
	self assert: (fastModel allWithType: FASTJavaNewExpression) size equals: 3 
]
