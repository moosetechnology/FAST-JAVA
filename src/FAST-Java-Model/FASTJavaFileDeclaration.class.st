"
I represent a compilation unit, I can contain declarations for a package, imports, and class or interface
"
Class {
	#name : #FASTJavaFileDeclaration,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithQualifiedName + FASTTEntity',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithQualifiedName classTrait + FASTTEntity classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaFileDeclaration class >> annotation [

	<FMClass: #FileDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
