"
I represent a float literal node.
example:
```java
float f = 12.3f;
```
`12.3f` is the literal
"
Class {
	#name : #FASTJavaFloatLiteral,
	#superclass : #FASTJavaLiteral,
	#traits : 'FASTTLiteral',
	#classTraits : 'FASTTLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaFloatLiteral class >> annotation [

	<FMClass: #FloatLiteral super: #FASTJavaLiteral>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
