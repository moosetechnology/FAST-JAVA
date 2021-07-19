"
Java integer literal node
"
Class {
	#name : #FASTJavaIntegerLiteral,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTReceiver + FASTTLiteral',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTTLiteral classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaIntegerLiteral class >> annotation [

	<FMClass: #IntegerLiteral super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]
