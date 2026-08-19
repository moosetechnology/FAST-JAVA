Class {
	#name : 'JavaSmaCCArrayInitializationExpressionTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCArrayInitializationExpressionTest >> javaMethod [
	^ 'void arrayAccess() {
	Veggies veggies[] = { new BlackOlives(), new Spinach(), new Eggplant() };
}'
]

{ #category : 'tests' }
JavaSmaCCArrayInitializationExpressionTest >> testNumberOfInitializedElement [
	self assert: (fastModel allWithType: FASTJavaNewExpression) size equals: 3 
]
