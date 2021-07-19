"
Binary java operations in  format: <expr> <operator> <expr>

ex:
	a + b
	3 == 6
	a = 6
"
Class {
	#name : #FASTJavaInfixOperation,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#instVars : [
		'#operator => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaInfixOperation class >> annotation [

	<FMClass: #InfixOperation super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaInfixOperation >> leftOperand [
	"Relation named: #leftOperand type: #FASTTExpression opposite: #infixOperationLeftOperandOwner"

	<generated>
	<FMComment: 'leftOperand'>
	<FMProperty: #leftOperand type: #FASTTExpression opposite: #infixOperationLeftOperandOwner>
	^ self attributeAt: #leftOperand ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaInfixOperation >> leftOperand: anObject [

	<generated>
	(self attributeAt: #leftOperand ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self leftOperand.
		self attributeAt: #leftOperand put: anObject.
		otherSide infixOperationLeftOperandOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #leftOperand put: anObject.
		anObject infixOperationLeftOperandOwner: self ]
]

{ #category : #navigation }
FASTJavaInfixOperation >> leftOperandGroup [
	<generated>
	<navigation: 'LeftOperand'>
	^ MooseSpecializedGroup with: self leftOperand
]

{ #category : #accessing }
FASTJavaInfixOperation >> operator [

	<FMProperty: #operator type: #String>
	<generated>
	<FMComment: 'operator s symbol'>
	^ operator
]

{ #category : #accessing }
FASTJavaInfixOperation >> operator: anObject [
	<generated>
	operator := anObject
]

{ #category : #accessing }
FASTJavaInfixOperation >> rightOperand [
	"Relation named: #rightOperand type: #FASTTExpression opposite: #infixOperationRightOperandOwner"

	<generated>
	<FMComment: 'rightOperand'>
	<FMProperty: #rightOperand type: #FASTTExpression opposite: #infixOperationRightOperandOwner>
	^ self attributeAt: #rightOperand ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaInfixOperation >> rightOperand: anObject [

	<generated>
	(self attributeAt: #rightOperand ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self rightOperand.
		self attributeAt: #rightOperand put: anObject.
		otherSide infixOperationRightOperandOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #rightOperand put: anObject.
		anObject infixOperationRightOperandOwner: self ]
]

{ #category : #navigation }
FASTJavaInfixOperation >> rightOperandGroup [
	<generated>
	<navigation: 'RightOperand'>
	^ MooseSpecializedGroup with: self rightOperand
]
