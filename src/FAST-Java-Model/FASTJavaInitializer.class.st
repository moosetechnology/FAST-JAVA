"
I represent a Java initializer
	
ex.:

new Button(){

{ something }

}

"
Class {
	#name : #FASTJavaInitializer,
	#superclass : #FASTScopableEntity,
	#traits : 'FamixTWithImmediateSource',
	#classTraits : 'FamixTWithImmediateSource classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaInitializer class >> annotation [

	<MSEClass: #Initializer super: #FASTScopableEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaInitializer class >> generatedSlotNames [
	<generated>
	'FASTJavaInitializer class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaInitializer class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithImmediateSource)
]

{ #category : #meta }
FASTJavaInitializer class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaInitializer >> statementBlock [

	<generated>
	<MSEComment: 'Statements block of the behavioural entity'>
	<MSEProperty: #statementBlock type: #Object>
	^ self privateState attributeAt: #statementBlock ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaInitializer >> statementBlock: anObject [

	<generated>
	(self privateState attributeAt: #statementBlock ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #statementBlock put: anObject.
	anObject javaInitializerOwner: self
]

{ #category : #navigation }
FASTJavaInitializer >> statementBlockGroup [

	<generated>
	<navigation: 'StatementBlock'>
	^ MooseGroup
			with: (self statementBlock)
]
