Class {
	#name : #FASTJavaSourcedEntity,
	#superclass : #FASTEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FASTEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]
