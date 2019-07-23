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
	anObject ifNil: [ | otherSide |
		otherSide :=  self type.
		self privateState attributeAt: #type put: anObject.
		otherSide javaParameterTypeOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #type put: anObject.
		anObject javaParameterTypeOwner: self ]
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
	anObject ifNil: [ | otherSide |
		otherSide :=  self variable.
		self privateState attributeAt: #variable put: anObject.
		otherSide javaParameterVariableOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #variable put: anObject.
		anObject javaParameterVariableOwner: self ]
]

{ #category : #navigation }
FASTJavaParameter >> variableGroup [

	<generated>
	<navigation: 'Variable'>
	^ MooseGroup
			with: (self variable)
]
