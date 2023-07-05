"
A node representing a Java comment (block or line comment)
"
Class {
	#name : #FASTJavaComment,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTComment',
	#classTraits : 'FASTTComment classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaComment class >> annotation [

	<FMClass: #Comment super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]
