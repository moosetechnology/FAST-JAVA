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
	#superclass : #FASTVariableExpression,
	#instVars : [
		'#fieldName => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaClassProperty class >> annotation [

	<MSEClass: #ClassProperty super: #FASTVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
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
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaClassPropertyOwner"

	<generated>
	<MSEComment: 'The owner type'>
	<MSEProperty: #type type: #Object>
	^ self privateState attributeAt: #type ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaClassProperty >> type: anObject [

	<generated>
	(self privateState attributeAt: #type ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self type.
		self privateState attributeAt: #type put: anObject.
		otherSide javaClassPropertyOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #type put: anObject.
		anObject javaClassPropertyOwner: self ]
]

{ #category : #navigation }
FASTJavaClassProperty >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseGroup with: self type
]
