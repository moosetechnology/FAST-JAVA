"
I name a module mine depends on, and whether that dependency is static or transitive (JLS 7.7.1).

```language=text
requires static transitive java.logging;
```

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStatic` | `Boolean` | false | Whether the module required is needed at compile time only (JLS 7.7.1)|
| `isTransitive` | `Boolean` | false | Whether a module reading mine also reads the module required (JLS 7.7.1)|

"
Class {
	#name : 'FASTJavaRequiresDirective',
	#superclass : 'FASTJavaModuleDirective',
	#instVars : [
		'#isStatic => FMProperty defaultValue: false',
		'#isTransitive => FMProperty defaultValue: false'
	],
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

{ #category : 'accessing' }
FASTJavaRequiresDirective >> isStatic [

	<FMProperty: #isStatic type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Whether the module required is needed at compile time only (JLS 7.7.1)'>
	^ isStatic ifNil: [ isStatic := false ]
]

{ #category : 'accessing' }
FASTJavaRequiresDirective >> isStatic: anObject [
	<ignoreForCoverage>
	<generated>
	isStatic := anObject
]

{ #category : 'accessing' }
FASTJavaRequiresDirective >> isTransitive [

	<FMProperty: #isTransitive type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Whether a module reading mine also reads the module required (JLS 7.7.1)'>
	^ isTransitive ifNil: [ isTransitive := false ]
]

{ #category : 'accessing' }
FASTJavaRequiresDirective >> isTransitive: anObject [
	<ignoreForCoverage>
	<generated>
	isTransitive := anObject
]
