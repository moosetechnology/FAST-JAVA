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
		'#catches => FMMany type: #FASTJavaCatchPartStatement opposite: #tryOwner'
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
FASTJavaTryCatchStatement >> addFinally: anObject [
	<generated>
	^ self finally add: anObject
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
	"Relation named: #finally type: #FASTTStatement opposite: #tryFinallyOwner"

	<generated>
	<FMComment: 'I contain the ''finally'' part of the try/catch/finally'>
	<derived>
	<FMProperty: #finally type: #FASTTStatement opposite: #tryFinallyOwner>
	^ self attributeAt: #finally ifAbsentPut: [ FMMultivalueLink on: self opposite: #tryFinallyOwner: ]
]

{ #category : #accessing }
FASTJavaTryCatchStatement >> finally: anObject [

	<generated>
	self finally value: anObject
]

{ #category : #navigation }
FASTJavaTryCatchStatement >> finallyGroup [
	<generated>
	<navigation: 'Finally'>
	^ MooseSpecializedGroup withAll: self finally asSet
]

{ #category : #accessing }
FASTJavaTryCatchStatement >> try [
	"Relation named: #try type: #FASTTStatement opposite: #javaTryCatchOwner"

	<generated>
	<FMComment: 'I represent the ''try'' part of the TryCatch Statement'>
	<FMProperty: #try type: #FASTTStatement opposite: #javaTryCatchOwner>
	^ self attributeAt: #try ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaTryCatchStatement >> try: anObject [

	<generated>
	(self attributeAt: #try ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self try.
		self attributeAt: #try put: anObject.
		otherSide javaTryCatchOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #try put: anObject.
		anObject javaTryCatchOwner: self ]
]

{ #category : #navigation }
FASTJavaTryCatchStatement >> tryGroup [
	<generated>
	<navigation: 'Try'>
	^ MooseSpecializedGroup with: self try
]
