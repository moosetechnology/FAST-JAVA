Class {
	#name : #FASTJavaNamedEntity,
	#superclass : #FASTJavaSourcedEntity,
	#traits : 'FamixTNamed + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FASTJavaSourcedEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaNamedEntity class >> generatedSlotNames [
	<generated>
	'FASTJavaNamedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaNamedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FASTJavaNamedEntity class >> requirements [

	<generated>
	^ {  }
]
