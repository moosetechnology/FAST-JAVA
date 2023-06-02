"
I represent a package declaration, e.g. `package fr.inria;`
"
Class {
	#name : #FASTJavaPackageDeclaration,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithQualifiedName + FASTTEntity',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithQualifiedName classTrait + FASTTEntity classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaPackageDeclaration class >> annotation [

	<FMClass: #PackageDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
