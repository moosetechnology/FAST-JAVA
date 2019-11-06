Class {
	#name : #FASTJavaNamedEntity,
	#superclass : #MooseEntity,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #MooseEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaNamedEntity class >> metamodel [

	<generated>
	^ FASTJavaModel metamodel
]

{ #category : #testing }
FASTJavaNamedEntity >> isAssociation [

	<generated>
	^ false
]
