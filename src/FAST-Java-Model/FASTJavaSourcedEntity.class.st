Class {
	#name : #FASTJavaSourcedEntity,
	#superclass : #FASTEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FASTEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]
