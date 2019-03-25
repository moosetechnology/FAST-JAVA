"
A FASTJavaClassProperty corresponds to the access to a class property
	
	It is not the same as the field access because there are some specific usage of class property to access the current object.
	
ex.

class Enclosing {
    void method(Enclosing other) {
        // ...
    }

    void otherMethod() {
        new Runnable() {
            public void run() {
                method(this);


								--> Does not compile. 'this' is a Runnable!



                method(Enclosing.this);

								--> Compiles fine.


            }
        }.run();
    }
}

"
Class {
	#name : #FASTJavaClassProperty,
	#superclass : #FASTExpression,
	#instVars : [
		'fieldName'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaClassProperty class >> annotation [

	<MSEClass: #ClassProperty super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaClassProperty class >> generatedSlotNames [
	<generated>
	'FASTJavaClassProperty class>>#generatedSlotNames'.
	^ #(fieldName)
]

{ #category : #generator }
FASTJavaClassProperty class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaClassProperty class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaClassProperty >> fieldName [

	<MSEProperty: #fieldName type: #String>
	<generated>
	<MSEComment: 'Name of accessed field'>
	^ fieldName
]

{ #category : #accessing }
FASTJavaClassProperty >> fieldName: anObject [

	<generated>
	fieldName := anObject

]

{ #category : #accessing }
FASTJavaClassProperty >> type [

	<generated>
	<MSEComment: 'The owner type'>
	<MSEProperty: #type type: #Object>
	^ self privateState attributeAt: #type ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaClassProperty >> type: anObject [

	<generated>
	(self privateState attributeAt: #type ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #type put: anObject.
	anObject javaClassPropertyOwner: self
]

{ #category : #navigation }
FASTJavaClassProperty >> typeGroup [

	<generated>
	<navigation: 'Type'>
	^ MooseGroup
			with: (self type)
]
