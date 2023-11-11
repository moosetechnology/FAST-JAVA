"
I represent a long literal node.
example:
```java
long l = 2147483648L;
```
`2147483648L` is the literal
"
Class {
	#name : #FASTJavaLongLiteral,
	#superclass : #FASTJavaLiteral,
	#traits : 'FASTTLiteral',
	#classTraits : 'FASTTLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaLongLiteral class >> annotation [

	<FMClass: #LongLiteral super: #FASTJavaLiteral>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
