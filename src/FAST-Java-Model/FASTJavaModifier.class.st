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

	<FMClass: #Modifier super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaModifier >> token [

	<FMProperty: #token type: #String>
	<generated>
	<FMComment: 'The modifier value'>
	^ token
]

{ #category : #accessing }
FASTJavaModifier >> token: anObject [
	<generated>
	token := anObject
]
