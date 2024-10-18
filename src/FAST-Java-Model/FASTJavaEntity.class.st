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
	#name : 'FASTJavaEntity',
	#superclass : 'MooseEntity',
	#traits : 'FASTTEntity + FASTTWithComments',
	#classTraits : 'FASTTEntity classTrait + FASTTWithComments classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FASTJavaEntity class >> isAbstract [

	<generated>
	^ self == FASTJavaEntity
]

{ #category : 'meta' }
FASTJavaEntity class >> metamodel [

	<generated>
	^ FASTJavaModel metamodel
]

{ #category : 'testing' }
FASTJavaEntity >> isBehaviouralEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isBooleanLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCharacterLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isExpressionStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isNullPointerLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isQueryable [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isReturnStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isScopableEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isStatementBlock [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isStringLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVariableEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVariableExpression [

	<generated>
	^ false
]
