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
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTReceiver + FASTTLiteral',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTTLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaLongLiteral class >> annotation [

	<FMClass: #LongLiteral super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
