Class {
	#name : #JavaSmaCCLocalClassTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'throwMethod',
		'methodLocalClass'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCLocalClassTest >> methodLocalClass [
	
	^ 'methodLocalClass() {
        TestMethod t = new TestMethod() { 
            class DummyClass {};
            void implementMe() { 
                DummyClass dummy = new DummyClass();
            }
        };
}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCLocalClassTest >> setUp [
	super setUp.
	methodLocalClass := (self parseMethod: 'localClass')
]

{ #category : #'as yet unclassified' }
JavaSmaCCLocalClassTest >> testLocalClassExists [
	self assert: (methodLocalClass allWithType: FASTJavaClassDeclaration) size equals: 1
]
