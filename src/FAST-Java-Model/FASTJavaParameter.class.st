"
I represent a parameter of a method declaration
"
Class {
	#name : #FASTJavaParameter,
	#superclass : #FASTVariableExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaParameter class >> annotation [

	<MSEClass: #Parameter super: #FASTVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaParameter class >> generatedSlotNames [
	<generated>
	'FASTJavaParameter class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaParameter class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaParameter class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaParameter >> type [

	<generated>
	<MSEComment: 'The type of the parameter'>
	<MSEProperty: #type type: #Object>
	^ self privateState attributeAt: #type ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaParameter >> type: anObject [

	<generated>
	(self privateState attributeAt: #type ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #type put: anObject.
	anObject javaParameterTypeOwner: self
]

{ #category : #navigation }
FASTJavaParameter >> typeGroup [

	<generated>
	<navigation: 'Type'>
	^ MooseGroup
			with: (self type)
]

{ #category : #accessing }
FASTJavaParameter >> variable [

	<generated>
	<MSEComment: 'parameter variable'>
	<MSEProperty: #variable type: #Object>
	^ self privateState attributeAt: #variable ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaParameter >> variable: anObject [

	<generated>
	(self privateState attributeAt: #variable ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #variable put: anObject.
	anObject javaParameterVariableOwner: self
]

{ #category : #navigation }
FASTJavaParameter >> variableGroup [

	<generated>
	<navigation: 'Variable'>
	^ MooseGroup
			with: (self variable)
]
