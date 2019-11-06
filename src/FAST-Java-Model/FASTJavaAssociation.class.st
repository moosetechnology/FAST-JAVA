Class {
	#name : #FASTJavaAssociation,
	#superclass : #FASTJavaSourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAssociation class >> annotation [

	<FMClass: #Association super: #FASTJavaSourcedEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]
