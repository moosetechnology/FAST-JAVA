Class {
	#name : #FASTJavaQualifiedName,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAssignable + FASTTEntity + FASTTNamedEntity',
	#classTraits : 'FASTJavaTAssignable classTrait + FASTTEntity classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#namespace => FMOne type: #FASTJavaQualifiedName opposite: #qualifyNamespaceOwner',
		'#qualifiedNameOwner => FMOne type: #FASTJavaTWithQualifiedName opposite: #qualifiedName',
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
FASTJavaQualifiedName >> qualifiedNameOwner [
	"Relation named: #qualifiedNameOwner type: #FASTJavaTWithQualifiedName opposite: #qualifiedName"

	<generated>
	<FMComment: 'The owner of the qualified name'>
	<container>
	<derived>
	^ qualifiedNameOwner
]

{ #category : #accessing }
FASTJavaQualifiedName >> qualifiedNameOwner: anObject [

	<generated>
	qualifiedNameOwner := anObject
]

{ #category : #navigation }
FASTJavaQualifiedName >> qualifiedNameOwnerGroup [
	<generated>
	<navigation: 'QualifiedNameOwner'>
	^ MooseSpecializedGroup with: self qualifiedNameOwner
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
