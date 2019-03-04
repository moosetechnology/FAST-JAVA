"
Represents a method in FastJava
"
Class {
	#name : #FASTJavaMethodEntity,
	#superclass : #FASTNamedBehaviouralEntity,
	#traits : 'FamixTWithImmediateSource',
	#classTraits : 'FamixTWithImmediateSource classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodEntity class >> annotation [

	<MSEClass: #MethodEntity super: #FASTNamedBehaviouralEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaMethodEntity class >> generatedSlotNames [
	<generated>
	'FASTJavaMethodEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaMethodEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithImmediateSource)
]

{ #category : #meta }
FASTJavaMethodEntity class >> requirements [

	<generated>
	^ {  }
]
