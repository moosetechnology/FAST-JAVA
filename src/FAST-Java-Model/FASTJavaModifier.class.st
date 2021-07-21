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
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTModifier + FASTTExpression',
	#classTraits : 'FASTJavaTModifier classTrait + FASTTExpression classTrait',
	#instVars : [
		'#token => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaModifier class >> annotation [

	<FMClass: #Modifier super: #FASTJavaEntity>
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
