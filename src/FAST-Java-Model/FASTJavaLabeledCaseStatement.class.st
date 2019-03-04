"
I represent a Labeled case
	
ex.:

case LABEL:
"
Class {
	#name : #FASTJavaLabeledCaseStatement,
	#superclass : #FASTJavaCaseStatement,
	#instVars : [
		'label'
	],
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
	^ #(label)
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

	<MSEProperty: #label type: #FASTExpression>
	<generated>
	<MSEComment: 'The label of the case statement'>
	^ label
]

{ #category : #accessing }
FASTJavaLabeledCaseStatement >> label: anObject [

	<generated>
	label := anObject

]
