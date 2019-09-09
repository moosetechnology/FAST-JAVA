"
I am a Java modifier

example: 
for classes: 

- public
- default
- final
- abstract

for methods:

- public
- private
- default
- protected
- final
- static
- abstract
- transient
- synchronized
- volatile



"
Class {
	#name : #FASTJavaModifier,
	#superclass : #FASTExpression,
	#traits : 'FASTJavaTModifier',
	#classTraits : 'FASTJavaTModifier classTrait',
	#instVars : [
		'#token => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaModifier class >> annotation [

	<MSEClass: #Modifier super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaModifier class >> requirements [

	<generated>
	^ { FASTJavaClassDeclaration. FASTJavaMethodEntity }
]

{ #category : #accessing }
FASTJavaModifier >> token [

	<MSEProperty: #token type: #String>
	<generated>
	<MSEComment: 'The modifier value'>
	^ token
]

{ #category : #accessing }
FASTJavaModifier >> token: anObject [

	<generated>
	token := anObject

]
