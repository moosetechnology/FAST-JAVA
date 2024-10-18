"
I represent a Java comment (block or line comment)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `container` | `FASTTComment` | `comments` | `FASTTWithComments` | Source code entity containing the comment|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `content` | `String` | nil | Content of the comment as a String|

"
Class {
	#name : 'FASTJavaComment',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTComment',
	#classTraits : 'FASTTComment classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaComment class >> annotation [

	<FMClass: #Comment super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
