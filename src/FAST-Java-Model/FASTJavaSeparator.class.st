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

	<FMClass: #Separator super: #FASTJavaVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaSeparator >> separator [

	<FMProperty: #separator type: #String>
	<generated>
	<FMComment: 'separator'>
	^ separator
]

{ #category : #accessing }
FASTJavaSeparator >> separator: anObject [
	<generated>
	separator := anObject
]
