"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `javaExportsDirectiveTargetOwner` | `FASTJavaQualifiedName` | `targets` | `FASTJavaExportsDirective` | The exports directive that writes me as one of its targets|
| `javaOpensDirectiveTargetOwner` | `FASTJavaQualifiedName` | `targets` | `FASTJavaOpensDirective` | The opens directive that writes me as one of its targets|
| `javaProvidesDirectiveImplementationOwner` | `FASTJavaQualifiedName` | `implementations` | `FASTJavaProvidesDirective` | The provides directive that writes me as one of its implementations|
| `javaVariableAssignmentOwner` | `FASTJavaTAssignable` | `variable` | `FASTJavaTWithAssignable` | The owner of the assignment|
| `namespaceOwner` | `FASTJavaQualifiedName` | `namespace` | `FASTJavaQualifiedName` | The namespace I qualify|
| `qualifiedNameOwner` | `FASTJavaQualifiedName` | `qualifiedName` | `FASTJavaTWithQualifiedName` | The owner of the qualified name|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `namespace` | `FASTJavaQualifiedName` | `namespaceOwner` | `FASTJavaQualifiedName` | The namespace that qualifies me|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaQualifiedName',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTAssignable + FASTTEntity + FASTTNamedEntity',
	#classTraits : 'FASTJavaTAssignable classTrait + FASTTEntity classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#javaExportsDirectiveTargetOwner => FMOne type: #FASTJavaExportsDirective opposite: #targets',
		'#javaOpensDirectiveTargetOwner => FMOne type: #FASTJavaOpensDirective opposite: #targets',
		'#javaProvidesDirectiveImplementationOwner => FMOne type: #FASTJavaProvidesDirective opposite: #implementations',
		'#namespace => FMOne type: #FASTJavaQualifiedName opposite: #namespaceOwner',
		'#namespaceOwner => FMOne type: #FASTJavaQualifiedName opposite: #namespace',
		'#qualifiedNameOwner => FMOne type: #FASTJavaTWithQualifiedName opposite: #qualifiedName'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaQualifiedName class >> annotation [

	<ignoreForCoverage>
	<FMClass: #QualifiedName super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaQualifiedName >> isQualifiedName [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> javaExportsDirectiveTargetOwner [
	"Relation named: #javaExportsDirectiveTargetOwner type: #FASTJavaExportsDirective opposite: #targets"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The exports directive that writes me as one of its targets'>
	<container>
	^ javaExportsDirectiveTargetOwner
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> javaExportsDirectiveTargetOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaExportsDirectiveTargetOwner := anObject
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> javaOpensDirectiveTargetOwner [
	"Relation named: #javaOpensDirectiveTargetOwner type: #FASTJavaOpensDirective opposite: #targets"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The opens directive that writes me as one of its targets'>
	<container>
	^ javaOpensDirectiveTargetOwner
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> javaOpensDirectiveTargetOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaOpensDirectiveTargetOwner := anObject
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> javaProvidesDirectiveImplementationOwner [
	"Relation named: #javaProvidesDirectiveImplementationOwner type: #FASTJavaProvidesDirective opposite: #implementations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The provides directive that writes me as one of its implementations'>
	<container>
	^ javaProvidesDirectiveImplementationOwner
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> javaProvidesDirectiveImplementationOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaProvidesDirectiveImplementationOwner := anObject
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> namespace [
	"Relation named: #namespace type: #FASTJavaQualifiedName opposite: #namespaceOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The namespace that qualifies me'>
	^ namespace
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> namespace: anObject [

	<ignoreForCoverage>
	<generated>
	namespace := anObject
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> namespaceOwner [
	"Relation named: #namespaceOwner type: #FASTJavaQualifiedName opposite: #namespace"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The namespace I qualify'>
	<container>
	<derived>
	^ namespaceOwner
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> namespaceOwner: anObject [

	<ignoreForCoverage>
	<generated>
	namespaceOwner := anObject
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> qualifiedNameOwner [
	"Relation named: #qualifiedNameOwner type: #FASTJavaTWithQualifiedName opposite: #qualifiedName"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The owner of the qualified name'>
	<container>
	<derived>
	^ qualifiedNameOwner
]

{ #category : 'accessing' }
FASTJavaQualifiedName >> qualifiedNameOwner: anObject [

	<ignoreForCoverage>
	<generated>
	qualifiedNameOwner := anObject
]
