"
I represent a string literal node.
"
Class {
	#name : #FASTJavaStringLiteral,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTReceiver + FASTTStringLiteral',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTTStringLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaStringLiteral class >> annotation [

	<FMClass: #StringLiteral super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
