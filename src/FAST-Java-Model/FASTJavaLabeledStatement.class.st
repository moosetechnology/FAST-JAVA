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
	^self
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
FASTJavaLabeledStatement >> statementBlock [
	"Relation named: #statementBlock type: #FASTTStatementBlock opposite: #javaLabaledStatementOwner"

	<generated>
	<FMComment: 'Statements block of the behavioural entity'>
	<FMProperty: #statementBlock type: #FASTTStatementBlock opposite: #javaLabaledStatementOwner>
	^ self attributeAt: #statementBlock ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaLabeledStatement >> statementBlock: anObject [

	<generated>
	(self attributeAt: #statementBlock ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self statementBlock.
		self attributeAt: #statementBlock put: anObject.
		otherSide javaLabaledStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #statementBlock put: anObject.
		anObject javaLabaledStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaLabeledStatement >> statementBlockGroup [
	<generated>
	<navigation: 'StatementBlock'>
	^ MooseSpecializedGroup with: self statementBlock
]
