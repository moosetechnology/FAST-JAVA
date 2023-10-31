Class {
	#name : #FASTJavaLabeledStatement,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#label => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaLabeledStatement class >> annotation [

	<FMClass: #LabeledStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaLabeledStatement >> label [

	<FMProperty: #label type: #String>
	<generated>
	<FMComment: 'The label of the labeled statement'>
	^ label
]

{ #category : #accessing }
FASTJavaLabeledStatement >> label: anObject [
	<generated>
	label := anObject
]

{ #category : #accessing }
FASTJavaLabeledStatement >> labeledStatement [
	"Relation named: #labeledStatement type: #FASTTStatement opposite: #labelStatementOwner"

	<generated>
	<FMComment: 'Inner statement that is labeled'>
	<FMProperty: #labeledStatement type: #FASTTStatement opposite: #labelStatementOwner>
	^ self attributeAt: #labeledStatement ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaLabeledStatement >> labeledStatement: anObject [

	<generated>
	(self attributeAt: #labeledStatement ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self labeledStatement.
		self attributeAt: #labeledStatement put: anObject.
		otherSide labelStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #labeledStatement put: anObject.
		anObject labelStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaLabeledStatement >> labeledStatementGroup [
	<generated>
	<navigation: 'LabeledStatement'>
	^ MooseSpecializedGroup with: self labeledStatement
]
