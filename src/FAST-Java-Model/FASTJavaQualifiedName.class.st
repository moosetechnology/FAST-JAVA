Class {
	#name : #FASTJavaQualifiedName,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAssignable + FASTTEntity + FASTTNamedEntity',
	#classTraits : 'FASTJavaTAssignable classTrait + FASTTEntity classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#namespace => FMOne type: #FASTJavaQualifiedName opposite: #namespaceOwner',
		'#namespaceOwner => FMOne type: #FASTJavaQualifiedName opposite: #namespace',
		'#qualifiedNameOwner => FMOne type: #FASTJavaTWithQualifiedName opposite: #qualifiedName'
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
	"Relation named: #namespace type: #FASTJavaQualifiedName opposite: #namespaceOwner"

	<generated>
	<FMComment: 'The namespace that qualifies me'>
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
FASTJavaQualifiedName >> namespaceOwner [
	"Relation named: #namespaceOwner type: #FASTJavaQualifiedName opposite: #namespace"

	<generated>
	<FMComment: 'The namespace I qualify'>
	<container>
	<derived>
	^ namespaceOwner
]

{ #category : #accessing }
FASTJavaQualifiedName >> namespaceOwner: anObject [

	<generated>
	namespaceOwner := anObject
]

{ #category : #navigation }
FASTJavaQualifiedName >> namespaceOwnerGroup [
	<generated>
	<navigation: 'NamespaceOwner'>
	^ MooseSpecializedGroup with: self namespaceOwner
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
