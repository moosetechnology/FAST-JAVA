"
I represent a 'synchronized' statement
"
Class {
	#name : #FASTJavaSynchronizedStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSynchronizedStatement class >> annotation [

	<MSEClass: #SynchronizedStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaSynchronizedStatement >> block [
	"Relation named: #block type: #FASTStatementBlock opposite: #javaSynchronizedStatementOwner"

	<generated>
	<MSEComment: 'The block that is synchronized'>
	<MSEProperty: #block type: #FASTStatementBlock opposite: #javaSynchronizedStatementOwner>
	^ self privateState attributeAt: #block ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaSynchronizedStatement >> block: anObject [

	<generated>
	(self privateState attributeAt: #block ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self block.
		self privateState attributeAt: #block put: anObject.
		otherSide javaSynchronizedStatementOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #block put: anObject.
		anObject javaSynchronizedStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaSynchronizedStatement >> blockGroup [
	<generated>
	<navigation: 'Block'>
	^ MooseGroup with: self block
]

{ #category : #accessing }
FASTJavaSynchronizedStatement >> expression [
	"Relation named: #expression type: #FASTExpression opposite: #javaSynchronizedStatementOwner"

	<generated>
	<MSEComment: 'The instance on which the statement block is synchronized'>
	<MSEProperty: #expression type: #FASTExpression opposite: #javaSynchronizedStatementOwner>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaSynchronizedStatement >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self privateState attributeAt: #expression put: anObject.
		otherSide javaSynchronizedStatementOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #expression put: anObject.
		anObject javaSynchronizedStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaSynchronizedStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseGroup with: self expression
]
