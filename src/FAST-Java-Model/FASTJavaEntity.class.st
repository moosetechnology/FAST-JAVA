Class {
	#name : #FASTJavaEntity,
	#superclass : #FASTEntity,
	#traits : 'FASTTWithComments',
	#classTraits : 'FASTTWithComments classTrait',
	#category : #'FAST-Java-Model'
}

{ #category : #meta }
FASTJavaEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FASTJavaEntity class >> isAbstract [

	<generated>
	^ self == FASTJavaEntity
]

{ #category : #meta }
FASTJavaEntity class >> metamodel [

	<generated>
	^ FASTJavaModel metamodel
]

{ #category : #testing }
FASTJavaEntity >> isStatement [

	<generated>
	^ false
]
