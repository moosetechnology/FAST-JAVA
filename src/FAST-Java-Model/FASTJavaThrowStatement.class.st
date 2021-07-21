"
I represent a java throw statement
	
ex:

throw new Hello();
"
Class {
	#name : #FASTJavaThrowStatement,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaThrowStatement class >> annotation [

	<FMClass: #ThrowStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaThrowStatement >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #javaThrowStatementOwner"

	<generated>
	<FMComment: 'The throwed element'>
	<FMProperty: #expression type: #FASTTExpression opposite: #javaThrowStatementOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaThrowStatement >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaThrowStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaThrowStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaThrowStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
