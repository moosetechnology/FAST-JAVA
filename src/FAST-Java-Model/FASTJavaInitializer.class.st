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
