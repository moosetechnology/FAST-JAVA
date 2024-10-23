Class {
	#name : 'JavaSmaCCNewTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCNewTest >> javaMethod [
	^ 'void newMethod() {
	new Patate("hello", world());
}'
]

{ #category : 'tests' }
JavaSmaCCNewTest >> testNewName [
	self assert: fastMethod statements anyOne children anyOne type fullName equals: 'Patate'
]

{ #category : 'tests' }
JavaSmaCCNewTest >> testNewType [
	self assert: fastMethod statements first children anyOne class equals: FASTJavaNewExpression
]
