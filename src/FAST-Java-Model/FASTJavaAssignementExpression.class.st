"
An assignment expression mode.

Contains a referances to an assignee assignee and the expression that's being assigned.
"
Class {
	#name : #FASTJavaAssignementExpression,
	#superclass : #FASTExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAssignementExpression class >> annotation [

	<MSEClass: #AssignementExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaAssignementExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaAssignementExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaAssignementExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaAssignementExpression class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaAssignementExpression >> expression [

	<generated>
	<MSEComment: 'Expression that s being assigned upon declaration to the var'>
	<MSEProperty: #expression type: #Object>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaAssignementExpression >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self privateState attributeAt: #expression put: anObject.
		otherSide javaAssignementExpressioOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #expression put: anObject.
		anObject javaAssignementExpressioOwner: self ]
]

{ #category : #navigation }
FASTJavaAssignementExpression >> expressionGroup [

	<generated>
	<navigation: 'Expression'>
	^ MooseGroup
			with: (self expression)
]

{ #category : #accessing }
FASTJavaAssignementExpression >> variable [

	<generated>
	<MSEComment: 'Variable that s being assigned'>
	<MSEProperty: #variable type: #Object>
	^ self privateState attributeAt: #variable ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaAssignementExpression >> variable: anObject [

	<generated>
	(self privateState attributeAt: #variable ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self variable.
		self privateState attributeAt: #variable put: anObject.
		otherSide javaAssignementExpressioOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #variable put: anObject.
		anObject javaAssignementExpressioOwner: self ]
]

{ #category : #navigation }
FASTJavaAssignementExpression >> variableGroup [

	<generated>
	<navigation: 'Variable'>
	^ MooseGroup
			with: (self variable)
]
