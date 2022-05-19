Class {
	#name : #JavaSmaCCInfixOperationAsArgumentTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'infixOperation'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #accessing }
JavaSmaCCInfixOperationAsArgumentTest >> method [

	^ 'void method() {
		A a = new A(1 + 1);
	}'
]

{ #category : #accessing }
JavaSmaCCInfixOperationAsArgumentTest >> setUp [

	super setUp.
	infixOperation := ((self parseMethodString: self method) 
		                   allWithType: FASTJavaInfixOperation) first
]

{ #category : #accessing }
JavaSmaCCInfixOperationAsArgumentTest >> testInfixOperationHasParent [

	self assert: infixOperation parentNode isNotNil
]
