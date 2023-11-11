"
I represent a double literal node.
example:
```java
double d1 = 12.3;
double d2 = 12.3d;
```
`12.3` and `12.3d` are double literals
"
Class {
	#name : #FASTJavaDoubleLiteral,
	#superclass : #FASTJavaLiteral,
	#traits : 'FASTTLiteral',
	#classTraits : 'FASTTLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaDoubleLiteral class >> annotation [

	<FMClass: #DoubleLiteral super: #FASTJavaLiteral>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
