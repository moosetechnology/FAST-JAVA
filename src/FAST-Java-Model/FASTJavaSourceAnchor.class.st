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

{ #category : #generator }
FASTJavaSourceAnchor class >> generatedSlotNames [
	<generated>
	'FASTJavaSourceAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaSourceAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceAnchor TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FASTJavaSourceAnchor class >> requirements [

	<generated>
	^ {  }
]
