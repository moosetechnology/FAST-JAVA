"
Binary java operations in  format: <expr> <operator> <expr>

ex:
	a + b
	3 == 6
	a = 6
"
Class {
	#name : #FASTJavaInfixOperation,
	#superclass : #FASTExpression,
	#instVars : [
		'#operator => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaInfixOperation class >> annotation [

	<MSEClass: #InfixOperation super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaInfixOperation >> leftOperand [
	"Relation named: #leftOperand type: #FASTJavaExpression opposite: #infixOperationLeftOperandOwner"

	<generated>
	<MSEComment: 'leftOperand'>
	<MSEProperty: #leftOperand type: #Object>
	^ self privateState attributeAt: #leftOperand ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaInfixOperation >> leftOperand: anObject [

	<generated>
	(self privateState attributeAt: #leftOperand ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self leftOperand.
		self privateState attributeAt: #leftOperand put: anObject.
		otherSide infixOperationLeftOperandOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #leftOperand put: anObject.
		anObject infixOperationLeftOperandOwner: self ]
]

{ #category : #navigation }
FASTJavaInfixOperation >> leftOperandGroup [
	<generated>
	<navigation: 'LeftOperand'>
	^ MooseGroup with: self leftOperand
]

{ #category : #accessing }
FASTJavaInfixOperation >> operator [

	<MSEProperty: #operator type: #String>
	<generated>
	<MSEComment: 'operator s symbol'>
	^ operator
]

{ #category : #accessing }
FASTJavaInfixOperation >> operator: anObject [

	<generated>
	operator := anObject

]

{ #category : #accessing }
FASTJavaInfixOperation >> rightOperand [
	"Relation named: #rightOperand type: #FASTJavaExpression opposite: #infixOperationRightOperandOwner"

	<generated>
	<MSEComment: 'rightOperand'>
	<MSEProperty: #rightOperand type: #Object>
	^ self privateState attributeAt: #rightOperand ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaInfixOperation >> rightOperand: anObject [

	<generated>
	(self privateState attributeAt: #rightOperand ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self rightOperand.
		self privateState attributeAt: #rightOperand put: anObject.
		otherSide infixOperationRightOperandOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #rightOperand put: anObject.
		anObject infixOperationRightOperandOwner: self ]
]

{ #category : #navigation }
FASTJavaInfixOperation >> rightOperandGroup [
	<generated>
	<navigation: 'RightOperand'>
	^ MooseGroup with: self rightOperand
]
