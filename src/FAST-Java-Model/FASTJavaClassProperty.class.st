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


## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arrayOwner` | `FASTJavaTAnnotationElement` | `values` | `FASTJavaArrayAnnotationElement` | The ArrayAnnotationElement I am an element of|
| `parentAnnotation` | `FASTJavaTAnnotationElement` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, eg. ""unchecked"" in the following annotation: 	@SuppressWarnings(value=""unchecked"")|
| `receiverOwner` | `FASTJavaTReceiver` | `receiver` | `FASTJavaTWithReceiver` | The owner of the receiver|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `type` | `FASTJavaClassProperty` | `javaClassPropertyOwner` | `FASTJavaVariableExpression` | The type of the property|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `fieldName` | `String` | nil | Name of accessed field|

"
Class {
	#name : 'FASTJavaClassProperty',
	#superclass : 'FASTJavaVariableExpression',
	#traits : 'FASTJavaTAnnotationElement + FASTJavaTReceiver',
	#classTraits : 'FASTJavaTAnnotationElement classTrait + FASTJavaTReceiver classTrait',
	#instVars : [
		'#fieldName => FMProperty',
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaClassPropertyOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaClassProperty class >> annotation [

	<FMClass: #ClassProperty super: #FASTJavaVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTJavaClassProperty >> fieldName [

	<FMProperty: #fieldName type: #String>
	<generated>
	<FMComment: 'Name of accessed field'>
	^ fieldName
]

{ #category : 'accessing' }
FASTJavaClassProperty >> fieldName: anObject [
	<generated>
	fieldName := anObject
]

{ #category : 'testing' }
FASTJavaClassProperty >> isClassProperty [

	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaClassProperty >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaClassPropertyOwner"

	<generated>
	<FMComment: 'The type of the property'>
	^ type
]

{ #category : 'accessing' }
FASTJavaClassProperty >> type: anObject [

	<generated>
	type := anObject
]

{ #category : 'navigation' }
FASTJavaClassProperty >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseSpecializedGroup with: self type
]
