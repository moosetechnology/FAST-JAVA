Class {
	#name : #FASTJavaNaiveSlicer,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'slice',
		'targetStatement',
		'variables'
	],
	#category : #'FAST-Java-Tools-slicing'
}

{ #category : #'as yet unclassified' }
FASTJavaNaiveSlicer >> slice: aFASTJavaNode statement: aFASTStatement variable: aName [
	slice := OrderedCollection new.
	targetStatement := aFASTStatement.
	variables := { aName }.
	aFASTJavaNode accept: self
	
]

{ #category : #visiting }
FASTJavaNaiveSlicer >> visitFASTTStatement: aFASTTStatement [
	
]
