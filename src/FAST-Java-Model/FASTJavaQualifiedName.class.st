"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `javaVariableAssignmentOwner` | `FASTJavaTAssignable` | `variable` | `FASTJavaTWithAssignable` | The owner of the assignment|
| `namespaceOwner` | `FASTJavaQualifiedName` | `namespace` | `FASTJavaQualifiedName` | The namespace I qualify|
| `qualifiedNameOwner` | `FASTJavaQualifiedName` | `qualifiedName` | `FASTJavaTWithQualifiedName` | The owner of the qualified name|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `namespace` | `FASTJavaQualifiedName` | `namespaceOwner` | `FASTJavaQualifiedName` | The namespace that qualifies me|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTJavaQualifiedName,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAssignable + FASTTEntity + FASTTNamedEntity',
	#classTraits : 'FASTJavaTAssignable classTrait + FASTTEntity classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#namespace => FMOne type: #FASTJavaQualifiedName opposite: #namespaceOwner',
		'#namespaceOwner => FMOne type: #FASTJavaQualifiedName opposite: #namespace',
		'#qualifiedNameOwner => FMOne type: #FASTJavaTWithQualifiedName opposite: #qualifiedName'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaQualifiedName class >> annotation [

	<FMClass: #QualifiedName super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaQualifiedName >> namespace [
	"Relation named: #namespace type: #FASTJavaQualifiedName opposite: #namespaceOwner"

	<generated>
	<FMComment: 'The namespace that qualifies me'>
	^ namespace
]

{ #category : #accessing }
FASTJavaQualifiedName >> namespace: anObject [

	<generated>
	namespace := anObject
]

{ #category : #navigation }
FASTJavaQualifiedName >> namespaceGroup [
	<generated>
	<navigation: 'Namespace'>
	^ MooseSpecializedGroup with: self namespace
]

{ #category : #accessing }
FASTJavaQualifiedName >> namespaceOwner [
	"Relation named: #namespaceOwner type: #FASTJavaQualifiedName opposite: #namespace"

	<generated>
	<FMComment: 'The namespace I qualify'>
	<container>
	<derived>
	^ namespaceOwner
]

{ #category : #accessing }
FASTJavaQualifiedName >> namespaceOwner: anObject [

	<generated>
	namespaceOwner := anObject
]

{ #category : #navigation }
FASTJavaQualifiedName >> namespaceOwnerGroup [
	<generated>
	<navigation: 'NamespaceOwner'>
	^ MooseSpecializedGroup with: self namespaceOwner
]

{ #category : #accessing }
FASTJavaQualifiedName >> qualifiedNameOwner [
	"Relation named: #qualifiedNameOwner type: #FASTJavaTWithQualifiedName opposite: #qualifiedName"

	<generated>
	<FMComment: 'The owner of the qualified name'>
	<container>
	<derived>
	^ qualifiedNameOwner
]

{ #category : #accessing }
FASTJavaQualifiedName >> qualifiedNameOwner: anObject [

	<generated>
	qualifiedNameOwner := anObject
]

{ #category : #navigation }
FASTJavaQualifiedName >> qualifiedNameOwnerGroup [
	<generated>
	<navigation: 'QualifiedNameOwner'>
	^ MooseSpecializedGroup with: self qualifiedNameOwner
]
