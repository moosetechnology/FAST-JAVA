"
I represent the receiver parameter a method writes to carry the annotations of the instance it is called on (JLS 8.4.1)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `methodOwner` | `FASTJavaReceiverParameter` | `receiver` | `FASTJavaMethodEntity` | The method that writes me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotations` | `FASTJavaTWithAnnotations` | `javaAnnotationOwner` | `FASTJavaAnnotation` | The annotations written on me|
| `type` | `FASTJavaReceiverParameter` | `javaReceiverParameterTypeOwner` | `FASTJavaTypeExpression` | The type of the instance the method is called on|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `qualifier` | `String` | nil | The name written before `this`, as the `Outer` of `Outer.this` (JLS 8.4.1)|
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaReceiverParameter',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTWithAnnotations + FASTTEntity',
	#classTraits : 'FASTJavaTWithAnnotations classTrait + FASTTEntity classTrait',
	#instVars : [
		'#methodOwner => FMOne type: #FASTJavaMethodEntity opposite: #receiver',
		'#qualifier => FMProperty',
		'#type => FMOne type: #FASTJavaTypeExpression opposite: #javaReceiverParameterTypeOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaReceiverParameter class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ReceiverParameter super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaReceiverParameter >> isReceiverParameter [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaReceiverParameter >> methodOwner [
	"Relation named: #methodOwner type: #FASTJavaMethodEntity opposite: #receiver"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The method that writes me'>
	<container>
	<derived>
	^ methodOwner
]

{ #category : 'accessing' }
FASTJavaReceiverParameter >> methodOwner: anObject [

	<ignoreForCoverage>
	<generated>
	methodOwner := anObject
]

{ #category : 'accessing' }
FASTJavaReceiverParameter >> qualifier [

	<FMProperty: #qualifier type: #String>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'The name written before `this`, as the `Outer` of `Outer.this` (JLS 8.4.1)'>
	^ qualifier
]

{ #category : 'accessing' }
FASTJavaReceiverParameter >> qualifier: anObject [
	<ignoreForCoverage>
	<generated>
	qualifier := anObject
]

{ #category : 'accessing' }
FASTJavaReceiverParameter >> type [
	"Relation named: #type type: #FASTJavaTypeExpression opposite: #javaReceiverParameterTypeOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The type of the instance the method is called on'>
	^ type
]

{ #category : 'accessing' }
FASTJavaReceiverParameter >> type: anObject [

	<ignoreForCoverage>
	<generated>
	type := anObject
]
