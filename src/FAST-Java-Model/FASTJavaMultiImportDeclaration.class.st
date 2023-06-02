"
I represent a wildcard import declaration, e.g. `import java.util.*;`
"
Class {
	#name : #FASTJavaMultiImportDeclaration,
	#superclass : #FASTJavaImportDeclaration,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaMultiImportDeclaration class >> annotation [

	<FMClass: #MultiImportDeclaration super: #FASTJavaImportDeclaration>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
