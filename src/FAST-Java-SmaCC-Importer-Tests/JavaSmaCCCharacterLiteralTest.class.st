Class {
	#name : #JavaSmaCCCharacterLiteralTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCCharacterLiteralTest >> javaMethod [
	^ 'public void patate () {
	print(''A'');
}'
]

{ #category : #tests }
JavaSmaCCCharacterLiteralTest >> testCharacterLiteralType [
	self assert: fastMethod statements first children anyOne arguments first class equals: FASTJavaCharacterLiteral
]

{ #category : #tests }
JavaSmaCCCharacterLiteralTest >> testCharacterLiteralValue [
	self assert: fastMethod statements first children anyOne arguments first primitiveValue equals: $A
]
