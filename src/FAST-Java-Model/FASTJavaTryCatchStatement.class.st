"
I represent the java try catch statement. I must have two parts: the 'Try' part and the 'catch' part. 
	
ex.

void tryCatch() {
	int x;
	try {
		x = 1;
   } catch (Exception e) {
		Patate.displayError(e.getMessage());
	};
}


"
Class {
	#name : #FASTJavaTryCatchStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaTryCatchStatement class >> annotation [

	<MSEClass: #TryCatchStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaTryCatchStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaTryCatchStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaTryCatchStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaTryCatchStatement class >> requirements [

	<generated>
	^ {  }
]
