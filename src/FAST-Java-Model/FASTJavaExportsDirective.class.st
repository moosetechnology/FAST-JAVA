"
I export a package of my module, either to every module or to the ones I name (JLS 7.7.2).

```language=text
exports com.example.api to java.logging, java.desktop;
```

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `targets` | `FASTJavaExportsDirective` | `javaExportsDirectiveTargetOwner` | `FASTJavaQualifiedName` | The modules I export to, eg. the java.logging of `exports a.b to java.logging;`|



"
Class {
	#name : 'FASTJavaExportsDirective',
	#superclass : 'FASTJavaModuleDirective',
	#instVars : [
		'#targets => FMMany type: #FASTJavaQualifiedName opposite: #javaExportsDirectiveTargetOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaExportsDirective class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ExportsDirective super: #FASTJavaModuleDirective>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaExportsDirective >> addTarget: anObject [

	<ignoreForCoverage>
	<generated>
	^ self targets add: anObject
]

{ #category : 'testing' }
FASTJavaExportsDirective >> isExportsDirective [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaExportsDirective >> targets [
	"Relation named: #targets type: #FASTJavaQualifiedName opposite: #javaExportsDirectiveTargetOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The modules I export to, eg. the java.logging of `exports a.b to java.logging;`'>
	<derived>
	^ targets
]

{ #category : 'accessing' }
FASTJavaExportsDirective >> targets: anObject [

	<ignoreForCoverage>
	<generated>
	targets value: anObject
]
