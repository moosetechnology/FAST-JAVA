"
I am a bare `;` written where a class body expects a declaration, and I declare nothing.

JLS 8.1.6 allows one wherever a member may be written, so the source keeps parsing and the
compiler has nothing to do with me. I am held so that the source can be written back as it
was; I write no name, no modifiers and no body, which is why I am not a method.

```language=text
class Blah {
	void method() {
	};
}
```

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FASTJavaEmptyDeclaration` | `emptyDeclarations` | `FASTJavaCompilationUnit` | The compilation unit that writes me|
| `javaDeclarationOwner` | `FASTJavaTDeclaration` | `declarations` | `FASTJavaTWithDeclarations` | The element that declares me|



"
Class {
	#name : 'FASTJavaEmptyDeclaration',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTDeclaration',
	#classTraits : 'FASTJavaTDeclaration classTrait',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #emptyDeclarations'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaEmptyDeclaration class >> annotation [

	<ignoreForCoverage>
	<FMClass: #EmptyDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaEmptyDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #emptyDeclarations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The compilation unit that writes me'>
	<container>
	^ compilationUnit
]

{ #category : 'accessing' }
FASTJavaEmptyDeclaration >> compilationUnit: anObject [

	<ignoreForCoverage>
	<generated>
	compilationUnit := anObject
]

{ #category : 'testing' }
FASTJavaEmptyDeclaration >> isEmptyDeclaration [

	<ignoreForCoverage>
	<generated>
	^ true
]
