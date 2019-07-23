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
