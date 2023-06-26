"
A ""null-object"" signaling the declaration of a 'name' was not found
"
Class {
	#name : #FASTJavaNonLocalDeclaration,
	#superclass : #FASTJavaEntity,
	#instVars : [
		'name'
	],
	#category : #'FAST-Java-Tools-resolver'
}

{ #category : #accessing }
FASTJavaNonLocalDeclaration >> name [

	^ name
]

{ #category : #accessing }
FASTJavaNonLocalDeclaration >> name: anObject [

	name := anObject
]
