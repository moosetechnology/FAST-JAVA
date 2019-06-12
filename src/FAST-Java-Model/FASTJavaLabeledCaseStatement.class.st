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

	<MSEClass: #LabeledCaseStatement super: #FASTJavaCaseStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaLabeledCaseStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaLabeledCaseStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaLabeledCaseStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaLabeledCaseStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaLabeledCaseStatement >> label [

	<generated>
	<MSEComment: 'The label of the case statement'>
	<MSEProperty: #label type: #Object>
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
	^ MooseGroup
			with: (self label)
]
