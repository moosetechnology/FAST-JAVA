"
todo
"
Class {
	#name : #FASTJavaSeparator,
	#superclass : #FASTVariableExpression,
	#instVars : [
		'separator'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSeparator class >> annotation [

	<MSEClass: #Separator super: #FASTVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaSeparator class >> generatedSlotNames [
	<generated>
	'FASTJavaSeparator class>>#generatedSlotNames'.
	^ #(separator)
]

{ #category : #generator }
FASTJavaSeparator class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaSeparator class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaSeparator >> separator [

	<MSEProperty: #separator type: #String>
	<generated>
	<MSEComment: 'separator'>
	^ separator
]

{ #category : #accessing }
FASTJavaSeparator >> separator: anObject [

	<generated>
	separator := anObject

]
