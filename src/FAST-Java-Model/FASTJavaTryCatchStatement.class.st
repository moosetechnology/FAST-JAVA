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
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#try => FMOne type: #FASTJavaStatementBlock opposite: #javaTryCatchOwner',
		'#catches => FMMany type: #FASTJavaCatchPartStatement opposite: #tryOwner',
		'#finally => FMOne type: #FASTJavaStatementBlock opposite: #javaTryFinallyOwner',
		'#resources => FMMany type: #FASTJavaVarDeclStatement opposite: #javaTryResourceOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaTryCatchStatement class >> annotation [

	<FMClass: #TryCatchStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTJavaTryCatchStatement >> addCatch: anObject [
	<generated>
	^ self catches add: anObject
]

{ #category : #adding }
FASTJavaTryCatchStatement >> addResource: anObject [
	<generated>
	^ self resources add: anObject
]

{ #category : #accessing }
FASTJavaTryCatchStatement >> catches [
	"Relation named: #catches type: #FASTJavaCatchPartStatement opposite: #tryOwner"

	<generated>
	<FMComment: 'I contain all the catch statements'>
	<derived>
	^ catches
]

{ #category : #accessing }
FASTJavaTryCatchStatement >> catches: anObject [

	<generated>
	catches value: anObject
]

{ #category : #navigation }
FASTJavaTryCatchStatement >> catchesGroup [
	<generated>
	<navigation: 'Catches'>
	^ MooseSpecializedGroup withAll: self catches asSet
]

{ #category : #accessing }
FASTJavaTryCatchStatement >> finally [
	"Relation named: #finally type: #FASTJavaStatementBlock opposite: #javaTryFinallyOwner"

	<generated>
	<FMComment: 'I contain the ''finally'' part of the try/catch/finally'>
	^ finally
]

{ #category : #accessing }
FASTJavaTryCatchStatement >> finally: anObject [

	<generated>
	finally := anObject
]

{ #category : #navigation }
FASTJavaTryCatchStatement >> finallyGroup [
	<generated>
	<navigation: 'Finally'>
	^ MooseSpecializedGroup with: self finally
]

{ #category : #accessing }
FASTJavaTryCatchStatement >> resources [
	"Relation named: #resources type: #FASTJavaVarDeclStatement opposite: #javaTryResourceOwner"

	<generated>
	<FMComment: 'I contain the resources in a try-with-resource statement'>
	<derived>
	^ resources
]

{ #category : #accessing }
FASTJavaTryCatchStatement >> resources: anObject [

	<generated>
	resources value: anObject
]

{ #category : #navigation }
FASTJavaTryCatchStatement >> resourcesGroup [
	<generated>
	<navigation: 'Resources'>
	^ MooseSpecializedGroup withAll: self resources asSet
]

{ #category : #accessing }
FASTJavaTryCatchStatement >> try [
	"Relation named: #try type: #FASTJavaStatementBlock opposite: #javaTryCatchOwner"

	<generated>
	<FMComment: 'I represent the ''try'' part of the TryCatch Statement'>
	^ try
]

{ #category : #accessing }
FASTJavaTryCatchStatement >> try: anObject [

	<generated>
	try := anObject
]

{ #category : #navigation }
FASTJavaTryCatchStatement >> tryGroup [
	<generated>
	<navigation: 'Try'>
	^ MooseSpecializedGroup with: self try
]
