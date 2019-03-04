Class {
	#name : #FASTJavaAssociation,
	#superclass : #FASTJavaSourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAssociation class >> annotation [

	<MSEClass: #Association super: #FASTJavaSourcedEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaAssociation class >> generatedSlotNames [
	<generated>
	'FASTJavaAssociation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaAssociation class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation TAssociationMetaLevelDependency)
]

{ #category : #meta }
FASTJavaAssociation class >> requirements [

	<generated>
	^ {  }
]
