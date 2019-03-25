"
I represent a java outer this (only a call to 'this' to a class
	
ex.:

hello(MyClass.this)
"
Class {
	#name : #FASTJavaOuterThis,
	#superclass : #FASTExpression,
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
	^ #()
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

	<generated>
	<MSEComment: 'The accessed type'>
	<MSEProperty: #type type: #Object>
	^ self privateState attributeAt: #type ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaOuterThis >> type: anObject [

	<generated>
	(self privateState attributeAt: #type ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #type put: anObject.
	anObject javaOuterThisOwner: self
]

{ #category : #navigation }
FASTJavaOuterThis >> typeGroup [

	<generated>
	<navigation: 'Type'>
	^ MooseGroup
			with: (self type)
]
