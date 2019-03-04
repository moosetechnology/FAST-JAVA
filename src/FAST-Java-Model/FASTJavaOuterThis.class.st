"
I represent a java outer this (only a call to 'this' to a class
	
ex.:

hello(MyClass.this)
"
Class {
	#name : #FASTJavaOuterThis,
	#superclass : #FASTExpression,
	#instVars : [
		'type'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaOuterThis class >> annotation [

	<MSEClass: #OuterThis super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaOuterThis class >> generatedSlotNames [
	<generated>
	'FASTJavaOuterThis class>>#generatedSlotNames'.
	^ #(type)
]

{ #category : #generator }
FASTJavaOuterThis class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaOuterThis class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaOuterThis >> type [

	<MSEProperty: #type type: #FASTNamedEntity>
	<generated>
	<MSEComment: 'The accessed type'>
	^ type
]

{ #category : #accessing }
FASTJavaOuterThis >> type: anObject [

	<generated>
	type := anObject

]
