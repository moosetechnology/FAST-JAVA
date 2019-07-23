Class {
	#name : #FASTJavaSourceAnchor,
	#superclass : #FASTJavaEntity,
	#traits : 'FamixTSourceAnchor + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceAnchor classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaSourceAnchor class >> annotation [

	<MSEClass: #SourceAnchor super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]
