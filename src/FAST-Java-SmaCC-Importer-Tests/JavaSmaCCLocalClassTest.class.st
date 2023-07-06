Class {
	#name : #JavaSmaCCLocalClassTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'throwMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCLocalClassTest >> testLocalClassExists [
	self assert: (methodLocalClass allWithType: FASTJavaClassDeclaration) size equals: 1
]
