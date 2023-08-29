Class {
	#name : #FASTJavaEntity,
	#superclass : #MooseEntity,
	#traits : 'FASTTEntity + FASTTWithComments',
	#classTraits : 'FASTTEntity classTrait + FASTTWithComments classTrait',
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
