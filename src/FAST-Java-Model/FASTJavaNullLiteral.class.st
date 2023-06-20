"
I represent a `null` literal node.
"
Class {
	#name : #FASTJavaNullLiteral,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTNullPointerLiteral',
	#classTraits : 'FASTTNullPointerLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaNullLiteral class >> annotation [

	<FMClass: #NullLiteral super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
