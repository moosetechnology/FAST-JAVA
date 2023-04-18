"
An assignment expression mode.

Contains a referances to an assignee assignee and the expression that's being assigned.
"
Class {
	#name : #FASTJavaAssignmentExpression,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTWithAssignable + FASTTExpression',
	#classTraits : 'FASTJavaTWithAssignable classTrait + FASTTExpression classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAssignmentExpression class >> annotation [

	<FMClass: #AssignmentExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaAssignmentExpression >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #javaAssignmentExpressionOwner"

	<generated>
	<FMComment: 'Expression that s being assigned upon declaration to the var'>
	<FMProperty: #expression type: #FASTTExpression opposite: #javaAssignmentExpressionOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaAssignmentExpression >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaAssignmentExpressionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaAssignmentExpressionOwner: self ]
]

{ #category : #navigation }
FASTJavaAssignmentExpression >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
