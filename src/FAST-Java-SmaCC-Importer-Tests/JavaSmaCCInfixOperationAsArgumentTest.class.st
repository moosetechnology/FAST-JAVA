Class {
	#name : #JavaSmaCCInfixOperationAsArgumentTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #accessing }
JavaSmaCCInfixOperationAsArgumentTest >> javaMethod [

	^ 'void method() {
		A a = new A(1 + 1);
	}'
]

{ #category : #accessing }
JavaSmaCCInfixOperationAsArgumentTest >> testInfixOperationHasParent [

	self assert: (fastModel allWithType: FASTJavaInfixOperation) anyOne parentNode isNotNil
]
