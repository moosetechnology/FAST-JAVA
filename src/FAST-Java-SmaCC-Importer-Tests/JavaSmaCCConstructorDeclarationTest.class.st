Class {
	#name : #JavaSmaCCConstructorDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCConstructorDeclarationTest >> javaMethod [
	^ 'ArrayAccess() {
		int i = 3;
		hello.hello();
}'
]

{ #category : #tests }
JavaSmaCCConstructorDeclarationTest >> testConstructorName [
	self assert: fastMethod name equals: 'ArrayAccess'
]

{ #category : #tests }
JavaSmaCCConstructorDeclarationTest >> testNumberOfStatements [
	self assert: fastMethod statements size equals: 2
]
