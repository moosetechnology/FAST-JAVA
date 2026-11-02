"
I open a package of my module to reflection, either to every module or to the ones I name (JLS 7.7.2).

```language=text
opens com.example.model to java.logging;
```

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `targets` | `FASTJavaOpensDirective` | `javaOpensDirectiveTargetOwner` | `FASTJavaQualifiedName` | The modules I open to, eg. the java.logging of `opens a.b to java.logging;`|



"
Class {
	#name : 'FASTJavaOpensDirective',
	#superclass : 'FASTJavaModuleDirective',
	#instVars : [
		'#targets => FMMany type: #FASTJavaQualifiedName opposite: #javaOpensDirectiveTargetOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaOpensDirective class >> annotation [

	<ignoreForCoverage>
	<FMClass: #OpensDirective super: #FASTJavaModuleDirective>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaOpensDirective >> addTarget: anObject [

	<ignoreForCoverage>
	<generated>
	^ self targets add: anObject
]

{ #category : 'testing' }
FASTJavaOpensDirective >> isOpensDirective [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaOpensDirective >> targets [
	"Relation named: #targets type: #FASTJavaQualifiedName opposite: #javaOpensDirectiveTargetOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The modules I open to, eg. the java.logging of `opens a.b to java.logging;`'>
	<derived>
	^ targets
]

{ #category : 'accessing' }
FASTJavaOpensDirective >> targets: anObject [

	<ignoreForCoverage>
	<generated>
	targets value: anObject
]
