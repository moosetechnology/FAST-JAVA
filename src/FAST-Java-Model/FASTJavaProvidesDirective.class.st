"
I name a service my module implements, and the classes that implement it (JLS 7.7.4).

```language=text
provides com.example.Service with com.example.Impl;
```

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `implementations` | `FASTJavaProvidesDirective` | `javaProvidesDirectiveImplementationOwner` | `FASTJavaQualifiedName` | The classes implementing the service I provide, eg. the a.Impl of `provides a.S with a.Impl;`|



"
Class {
	#name : 'FASTJavaProvidesDirective',
	#superclass : 'FASTJavaModuleDirective',
	#instVars : [
		'#implementations => FMMany type: #FASTJavaQualifiedName opposite: #javaProvidesDirectiveImplementationOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaProvidesDirective class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ProvidesDirective super: #FASTJavaModuleDirective>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaProvidesDirective >> addImplementation: anObject [

	<ignoreForCoverage>
	<generated>
	^ self implementations add: anObject
]

{ #category : 'accessing' }
FASTJavaProvidesDirective >> implementations [
	"Relation named: #implementations type: #FASTJavaQualifiedName opposite: #javaProvidesDirectiveImplementationOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The classes implementing the service I provide, eg. the a.Impl of `provides a.S with a.Impl;`'>
	<derived>
	^ implementations
]

{ #category : 'accessing' }
FASTJavaProvidesDirective >> implementations: anObject [

	<ignoreForCoverage>
	<generated>
	implementations value: anObject
]

{ #category : 'testing' }
FASTJavaProvidesDirective >> isProvidesDirective [

	<ignoreForCoverage>
	<generated>
	^ true
]
