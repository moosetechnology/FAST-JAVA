"
todo
"
Class {
	#name : #FASTJavaSeparator,
	#superclass : #FASTJavaVariableExpression,
	#instVars : [
		'#separator => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSeparator class >> annotation [

	<MSEClass: #Separator super: #FASTJavaVariableExpression>
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
