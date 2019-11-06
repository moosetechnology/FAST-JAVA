"
I represent a Labeled case
	
ex.:

case LABEL:
"
Class {
	#name : #FASTJavaLabeledCaseStatement,
	#superclass : #FASTJavaCaseStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaLabeledCaseStatement class >> annotation [

	<FMClass: #LabeledCaseStatement super: #FASTJavaCaseStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaLabeledCaseStatement >> label [
	"Relation named: #label type: #FASTExpression opposite: #javaLabeledCaseStatementOwner"

	<generated>
	<FMComment: 'The label of the case statement'>
	<FMProperty: #label type: #FASTExpression opposite: #javaLabeledCaseStatementOwner>
	^ self privateState attributeAt: #label ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaLabeledCaseStatement >> label: anObject [

	<generated>
	(self privateState attributeAt: #label ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self label.
		self privateState attributeAt: #label put: anObject.
		otherSide javaLabeledCaseStatementOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #label put: anObject.
		anObject javaLabeledCaseStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaLabeledCaseStatement >> labelGroup [
	<generated>
	<navigation: 'Label'>
	^ MooseGroup with: self label
]
