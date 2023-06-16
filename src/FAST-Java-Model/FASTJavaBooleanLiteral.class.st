"
I represent a boolean literal node.
"
Class {
	#name : #FASTJavaBooleanLiteral,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTReceiver + FASTTLiteral',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTTLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaBooleanLiteral class >> annotation [

	<FMClass: #BooleanLiteral super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
