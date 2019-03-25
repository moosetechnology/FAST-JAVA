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

	<MSEClass: #ThrowStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaThrowStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaThrowStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaThrowStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaThrowStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaThrowStatement >> expression [

	<generated>
	<MSEComment: 'The throwed element'>
	<MSEProperty: #expression type: #Object>
	^ self privateState attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaThrowStatement >> expression: anObject [

	<generated>
	(self privateState attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #expression put: anObject.
	anObject javaThrowStatementOwner: self
]

{ #category : #navigation }
FASTJavaThrowStatement >> expressionGroup [

	<generated>
	<navigation: 'Expression'>
	^ MooseGroup
			with: (self expression)
]
