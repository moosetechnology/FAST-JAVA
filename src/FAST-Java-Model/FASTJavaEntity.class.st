Class {
	#name : #FASTJavaEntity,
	#superclass : #MooseEntity,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaEntity class >> metamodel [

	<generated>
	^ FASTJavaModel metamodel
]
