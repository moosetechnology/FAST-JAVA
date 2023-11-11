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
	#superclass : #FASTJavaLiteral,
	#traits : 'FASTTCharacterLiteral',
	#classTraits : 'FASTTCharacterLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaCharacterLiteral class >> annotation [

	<FMClass: #CharacterLiteral super: #FASTJavaLiteral>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
