Class {
	#name : 'JavaSmaCCStringLiteralTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCStringLiteralTest >> javaMethod [
	^ 'public void patate () {
	print("Patate");
}'
]

{ #category : 'tests' }
JavaSmaCCStringLiteralTest >> testStringLiteralType [
	self assert: fastMethod statements first children anyOne arguments first class equals: FASTJavaStringLiteral
]

{ #category : 'tests' }
JavaSmaCCStringLiteralTest >> testStringLiteralValue [
	self assert: fastMethod statements first children anyOne arguments first primitiveValue equals: 'Patate'
]
