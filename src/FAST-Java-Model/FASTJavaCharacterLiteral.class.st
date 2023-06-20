"
I represent a character literal node.
example:
```java
char c = 'a';
```
`'a'` is the literal
"
Class {
	#name : #FASTJavaCharacterLiteral,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTReceiver + FASTTCharacterLiteral',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTTCharacterLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaCharacterLiteral class >> annotation [

	<FMClass: #CharacterLiteral super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
