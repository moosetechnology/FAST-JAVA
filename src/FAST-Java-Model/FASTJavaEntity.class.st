"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FASTTWithComments` | `container` | `FASTTComment` | list of comments defined in the entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaEntity,
	#superclass : #MooseEntity,
	#traits : 'FASTTEntity + FASTTWithComments',
	#classTraits : 'FASTTEntity classTrait + FASTTWithComments classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FASTJavaEntity class >> isAbstract [

	<generated>
	^ self == FASTJavaEntity
]

{ #category : #meta }
FASTJavaEntity class >> metamodel [

	<generated>
	^ FASTJavaModel metamodel
]

{ #category : #testing }
FASTJavaEntity >> isQueryable [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isStatement [

	<generated>
	^ false
]
