"
I represent a 'synchronized' statement
"
Class {
	#name : #FASTJavaSynchronizedStatement,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSynchronizedStatement class >> annotation [

	<FMClass: #SynchronizedStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaSynchronizedStatement >> block [
	"Relation named: #block type: #FASTTStatementBlock opposite: #javaSynchronizedStatementOwner"

	<generated>
	<FMComment: 'The block that is synchronized'>
	<FMProperty: #block type: #FASTTStatementBlock opposite: #javaSynchronizedStatementOwner>
	^ self attributeAt: #block ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaSynchronizedStatement >> block: anObject [

	<generated>
	(self attributeAt: #block ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self block.
		self attributeAt: #block put: anObject.
		otherSide javaSynchronizedStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #block put: anObject.
		anObject javaSynchronizedStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaSynchronizedStatement >> blockGroup [
	<generated>
	<navigation: 'Block'>
	^ MooseSpecializedGroup with: self block
]

{ #category : #accessing }
FASTJavaSynchronizedStatement >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #javaSynchronizedStatementOwner"

	<generated>
	<FMComment: 'The instance on which the statement block is synchronized'>
	<FMProperty: #expression type: #FASTTExpression opposite: #javaSynchronizedStatementOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaSynchronizedStatement >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaSynchronizedStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaSynchronizedStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaSynchronizedStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
