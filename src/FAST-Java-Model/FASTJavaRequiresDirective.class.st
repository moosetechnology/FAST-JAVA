"
I name a module mine depends on, and whether that dependency is static or transitive (JLS 7.7.1).

```language=text
requires static transitive java.logging;
```

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaModifier` | The keywords I write|



"
Class {
	#name : 'FASTJavaRequiresDirective',
	#superclass : 'FASTJavaModuleDirective',
	#traits : 'FASTJavaTWithModifiers',
	#classTraits : 'FASTJavaTWithModifiers classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaRequiresDirective class >> annotation [

	<ignoreForCoverage>
	<FMClass: #RequiresDirective super: #FASTJavaModuleDirective>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaRequiresDirective >> isRequiresDirective [

	<ignoreForCoverage>
	<generated>
	^ true
]
