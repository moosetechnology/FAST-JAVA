"
I reprensent an empty method declaration
	
ex.:
void newMethod() {
	new Patate() {
		//The empty method declaration is "";"" 
		;
		
	};
}


"
Class {
	#name : 'FASTJavaEmptyMethodDeclaration',
	#superclass : 'FASTJavaMethodEntity',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaEmptyMethodDeclaration class >> annotation [

	<FMClass: #EmptyMethodDeclaration super: #FASTJavaMethodEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'testing' }
FASTJavaEmptyMethodDeclaration >> isEmptyMethodDeclaration [

	<generated>
	^ true
]
