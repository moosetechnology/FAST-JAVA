"
I represent a java throw statement
	
ex:

throw new Hello();
"
Class {
	#name : #FASTJavaThrowStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'expression'
	],
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
	^ #(expression)
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

	<MSEProperty: #expression type: #FASTExpression>
	<generated>
	<MSEComment: 'The throwed element'>
	^ expression
]

{ #category : #accessing }
FASTJavaThrowStatement >> expression: anObject [

	<generated>
	expression := anObject

]
