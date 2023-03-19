Class {
	#name : #FASTJavaQualifiedName,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAssigneable + FASTTEntity + FASTTNamedEntity',
	#classTraits : 'FASTJavaTAssigneable classTrait + FASTTEntity classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#fileDeclaration => FMOne type: #FASTJavaFileDeclaration opposite: #declarationName',
		'#namespace => FMOne type: #FASTJavaQualifiedName opposite: #qualifyNamespaceOwner',
		'#qualifyNamespaceOwner => FMOne type: #FASTJavaQualifiedName opposite: #namespace'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaQualifiedName class >> annotation [

	<FMClass: #QualifiedName super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaQualifiedName >> fileDeclaration [
	"Relation named: #fileDeclaration type: #FASTJavaFileDeclaration opposite: #declarationName"

	<generated>
	<container>
	<derived>
	^ fileDeclaration
]

{ #category : #accessing }
FASTJavaQualifiedName >> fileDeclaration: anObject [

	<generated>
	fileDeclaration := anObject
]

{ #category : #navigation }
FASTJavaQualifiedName >> fileDeclarationGroup [
	<generated>
	<navigation: 'FileDeclaration'>
	^ MooseSpecializedGroup with: self fileDeclaration
]

{ #category : #accessing }
FASTJavaQualifiedName >> namespace [
	"Relation named: #namespace type: #FASTJavaQualifiedName opposite: #qualifyNamespaceOwner"

	<generated>
	<FMComment: 'The namespace that qualified me'>
	^ namespace
]

{ #category : #accessing }
FASTJavaQualifiedName >> namespace: anObject [

	<generated>
	namespace := anObject
]

{ #category : #navigation }
FASTJavaQualifiedName >> namespaceGroup [
	<generated>
	<navigation: 'Namespace'>
	^ MooseSpecializedGroup with: self namespace
]

{ #category : #accessing }
FASTJavaQualifiedName >> qualifyNamespaceOwner [
	"Relation named: #qualifyNamespaceOwner type: #FASTJavaQualifiedName opposite: #namespace"

	<generated>
	<FMComment: 'The namespace qualified I qualify'>
	<container>
	<derived>
	^ qualifyNamespaceOwner
]

{ #category : #accessing }
FASTJavaQualifiedName >> qualifyNamespaceOwner: anObject [

	<generated>
	qualifyNamespaceOwner := anObject
]

{ #category : #navigation }
FASTJavaQualifiedName >> qualifyNamespaceOwnerGroup [
	<generated>
	<navigation: 'QualifyNamespaceOwner'>
	^ MooseSpecializedGroup with: self qualifyNamespaceOwner
]
