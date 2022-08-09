Class {
	#name : #FASTJavaFileDeclaration,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#instVars : [
		'#declarationName => FMOne type: #FASTJavaQualifiedName opposite: #fileDeclaration'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaFileDeclaration class >> annotation [

	<FMClass: #FileDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaFileDeclaration >> declarationName [
	"Relation named: #declarationName type: #FASTJavaQualifiedName opposite: #fileDeclaration"

	<generated>
	<FMComment: 'the first part of the qualified name of the declarationName'>
	^ declarationName
]

{ #category : #accessing }
FASTJavaFileDeclaration >> declarationName: anObject [

	<generated>
	declarationName := anObject
]

{ #category : #navigation }
FASTJavaFileDeclaration >> declarationNameGroup [
	<generated>
	<navigation: 'DeclarationName'>
	^ MooseSpecializedGroup with: self declarationName
]
