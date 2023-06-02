"
I represent an import declaration, e.g. `import java.util.List;`
"
Class {
	#name : #FASTJavaImportDeclaration,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithQualifiedName + FASTTEntity',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithQualifiedName classTrait + FASTTEntity classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaImportDeclaration class >> annotation [

	<FMClass: #ImportDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
