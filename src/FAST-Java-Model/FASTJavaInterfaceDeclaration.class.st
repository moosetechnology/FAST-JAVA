"
I represent an interface declaration
example

```java
public interface MyInterface {

    public static final String CODE = ""SEME"";

}
```

"
Class {
	#name : #FASTJavaInterfaceDeclaration,
	#superclass : #FASTJavaEntity,
	#traits : '(FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithModifiers + FASTTNamedEntity + FASTTStatement + FamixTHasImmediateSource withPrecedenceOf: FamixTHasImmediateSource)',
	#classTraits : '(FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithModifiers classTrait + FASTTNamedEntity classTrait + FASTTStatement classTrait + FamixTHasImmediateSource classTrait withPrecedenceOf: FamixTHasImmediateSource classTrait)',
	#instVars : [
		'#compilationUnit => FMOne type: #FASTJavaCompilationUnit opposite: #interfaceDeclarations',
		'#interfaces => FMMany type: #FASTJavaTypeExpression opposite: #javaInterfaceDeclarationInterfaceOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaInterfaceDeclaration class >> annotation [

	<FMClass: #InterfaceDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTJavaInterfaceDeclaration >> addInterface: anObject [
	<generated>
	^ self interfaces add: anObject
]

{ #category : #accessing }
FASTJavaInterfaceDeclaration >> compilationUnit [
	"Relation named: #compilationUnit type: #FASTJavaCompilationUnit opposite: #interfaceDeclarations"

	<generated>
	<FMComment: 'The compilation unit that owns me'>
	<container>
	^ compilationUnit
]

{ #category : #accessing }
FASTJavaInterfaceDeclaration >> compilationUnit: anObject [

	<generated>
	compilationUnit := anObject
]

{ #category : #navigation }
FASTJavaInterfaceDeclaration >> compilationUnitGroup [
	<generated>
	<navigation: 'CompilationUnit'>
	^ MooseSpecializedGroup with: self compilationUnit
]

{ #category : #accessing }
FASTJavaInterfaceDeclaration >> interfaces [
	"Relation named: #interfaces type: #FASTJavaTypeExpression opposite: #javaInterfaceDeclarationInterfaceOwner"

	<generated>
	<FMComment: 'My super interfaces'>
	<derived>
	^ interfaces
]

{ #category : #accessing }
FASTJavaInterfaceDeclaration >> interfaces: anObject [

	<generated>
	interfaces value: anObject
]

{ #category : #navigation }
FASTJavaInterfaceDeclaration >> interfacesGroup [
	<generated>
	<navigation: 'Interfaces'>
	^ MooseSpecializedGroup withAll: self interfaces asSet
]
