"
I represent a qualified name for a type

example:

new Canard.Poulet(){

}

""Canard.Poulet"" is the qualified name

""Poulet"" is the main name

""Canard"" is the namespace of the main name 

"
Class {
	#name : #FASTJavaQualifiedTypeName,
	#superclass : #FASTJavaTypeName,
	#instVars : [
		'#namespace => FMOne type: #FASTJavaTypeName opposite: #javaTypeNameQualify'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaQualifiedTypeName class >> annotation [

	<FMClass: #QualifiedTypeName super: #FASTJavaTypeName>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaQualifiedTypeName >> namespace [
	"Relation named: #namespace type: #FASTJavaTypeName opposite: #javaTypeNameQualify"

	<generated>
	<FMComment: 'The namespace of the name'>
	^ namespace
]

{ #category : #accessing }
FASTJavaQualifiedTypeName >> namespace: anObject [

	<generated>
	namespace := anObject
]

{ #category : #navigation }
FASTJavaQualifiedTypeName >> namespaceGroup [
	<generated>
	<navigation: 'Namespace'>
	^ MooseGroup with: self namespace
]
