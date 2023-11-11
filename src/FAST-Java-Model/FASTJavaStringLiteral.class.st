"
I represent a string literal node.
"
Class {
	#name : #FASTJavaStringLiteral,
	#superclass : #FASTJavaLiteral,
	#traits : 'FASTTStringLiteral',
	#classTraits : 'FASTTStringLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaStringLiteral class >> annotation [

	<FMClass: #StringLiteral super: #FASTJavaLiteral>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
