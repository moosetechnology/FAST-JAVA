"
I represent a java throw statement
	
ex:

throw new Hello();
"
Class {
	#name : #FASTJavaThrowStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaThrowStatement class >> annotation [

	<FMClass: #ThrowStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaThrowStatement >> expression [
	"Relation named: #expression type: #FASTExpression opposite: #javaThrowStatementOwner"

	<generated>
	<FMComment: 'The throwed element'>
	<FMProperty: #expression type: #FASTExpression opposite: #javaThrowStatementOwner>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaThrowStatement >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self privateState attributeAt: #expression put: anObject.
		otherSide javaThrowStatementOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #expression put: anObject.
		anObject javaThrowStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaThrowStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseGroup with: self expression
]
