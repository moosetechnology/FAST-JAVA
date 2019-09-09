Class {
	#name : #FASTJavaNamedEntity,
	#superclass : #MooseEntity,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #MooseEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaNamedEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #testing }
FASTJavaNamedEntity >> isAssociation [

	<generated>
	^ false
]
