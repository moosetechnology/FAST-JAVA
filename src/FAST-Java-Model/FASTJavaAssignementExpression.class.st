"
An assignment expression mode.

Contains a referances to an assignee assignee and the expression that's being assigned.
"
Class {
	#name : #FASTJavaAssignementExpression,
	#superclass : #FASTExpression,
	#traits : 'FASTJavaTWithAssigneable',
	#classTraits : 'FASTJavaTWithAssigneable classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAssignementExpression class >> annotation [

	<MSEClass: #AssignementExpression super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaAssignementExpression >> expression [
	"Relation named: #expression type: #FASTJavaExpression opposite: #javaAssignementExpressionOwner"

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
		otherSide javaAssignementExpressionOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #expression put: anObject.
		anObject javaAssignementExpressionOwner: self ]
]

{ #category : #navigation }
FASTJavaAssignementExpression >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseGroup with: self expression
]
