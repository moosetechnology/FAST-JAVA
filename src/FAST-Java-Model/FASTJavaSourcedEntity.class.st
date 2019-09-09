Class {
	#name : #FASTJavaSourcedEntity,
	#superclass : #FASTJavaEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]
