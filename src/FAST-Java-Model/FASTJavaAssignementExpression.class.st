"
An assignment expression mode.

Contains a referances to an assignee assignee and the expression that's being assigned.
"
Class {
	#name : #FASTJavaAssignementExpression,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTWithAssigneable + FASTTExpression',
	#classTraits : 'FASTJavaTWithAssigneable classTrait + FASTTExpression classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAssignementExpression class >> annotation [

	<FMClass: #AssignementExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaAssignementExpression >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #javaAssignementExpressionOwner"

	<generated>
	<FMComment: 'Expression that s being assigned upon declaration to the var'>
	<FMProperty: #expression type: #FASTTExpression opposite: #javaAssignementExpressionOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaAssignementExpression >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaAssignementExpressionOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaAssignementExpressionOwner: self ]
]

{ #category : #navigation }
FASTJavaAssignementExpression >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
