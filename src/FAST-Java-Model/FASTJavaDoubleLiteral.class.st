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
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTReceiver + FASTTLiteral',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTTLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaDoubleLiteral class >> annotation [

	<FMClass: #DoubleLiteral super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
