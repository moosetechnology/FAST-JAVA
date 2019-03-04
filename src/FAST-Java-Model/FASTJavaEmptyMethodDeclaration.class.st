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
	#name : #FASTJavaEmptyMethodDeclaration,
	#superclass : #FASTJavaMethodEntity,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaEmptyMethodDeclaration class >> annotation [

	<MSEClass: #EmptyMethodDeclaration super: #FASTJavaMethodEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaEmptyMethodDeclaration class >> generatedSlotNames [
	<generated>
	'FASTJavaEmptyMethodDeclaration class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaEmptyMethodDeclaration class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaEmptyMethodDeclaration class >> requirements [

	<generated>
	^ {  }
]
