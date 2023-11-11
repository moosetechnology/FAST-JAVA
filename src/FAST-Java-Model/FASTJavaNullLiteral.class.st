"
I represent a `null` literal node.
"
Class {
	#name : #FASTJavaNullLiteral,
	#superclass : #FASTJavaLiteral,
	#traits : 'FASTTNullPointerLiteral',
	#classTraits : 'FASTTNullPointerLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaNullLiteral class >> annotation [

	<FMClass: #NullLiteral super: #FASTJavaLiteral>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
