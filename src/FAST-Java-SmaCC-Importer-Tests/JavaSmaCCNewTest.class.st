Class {
	#name : #JavaSmaCCNewTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCNewTest >> methodNew [
	^ 'void newMethod() {
	new Patate("hello", world());
}'
]

{ #category : #running }
JavaSmaCCNewTest >> setUp [
	super setUp.
	methodNew := (self parseMethod: 'new') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCNewTest >> testNewName [
	self assert: methodNew statements anyOne children anyOne type fullName equals: 'Patate'
]

{ #category : #tests }
JavaSmaCCNewTest >> testNewType [
	self assert: methodNew statements first children anyOne class equals: FASTJavaNewExpression
]
