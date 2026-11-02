"
I name a service my module consumes through a service loader (JLS 7.7.3).

```language=text
uses com.example.Service;
```


"
Class {
	#name : 'FASTJavaUsesDirective',
	#superclass : 'FASTJavaModuleDirective',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaUsesDirective class >> annotation [

	<ignoreForCoverage>
	<FMClass: #UsesDirective super: #FASTJavaModuleDirective>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaUsesDirective >> isUsesDirective [

	<ignoreForCoverage>
	<generated>
	^ true
]
