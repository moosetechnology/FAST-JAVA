"
I represent a class declaration
example

public class ClassName extends SomeClass implements OneClass, TwoClass {

	int oneDeclaration;
	
	void methodDeclaration(){
	}
}
"
Class {
	#name : #FASTJavaClassDeclaration,
	#superclass : #FASTStatement,
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithModifiers + FamixTHasImmediateSource + FamixTNamedEntity',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithModifiers classTrait + FamixTHasImmediateSource classTrait + FamixTNamedEntity classTrait',
	#instVars : [
		'#interfaces => FMMany type: #FASTJavaTypeExpression opposite: #javaClassDeclarationInterfaceOwnver',
		'#superclass => FMOne type: #FASTJavaTypeExpression opposite: #javaClassDeclarationSuperclassOwnver'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaClassDeclaration class >> annotation [

	<FMClass: #ClassDeclaration super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTJavaClassDeclaration >> addInterface: anObject [
	<generated>
	^ self interfaces add: anObject
]

{ #category : #accessing }
FASTJavaClassDeclaration >> interfaces [
	"Relation named: #interfaces type: #FASTJavaTypeExpression opposite: #javaClassDeclarationInterfaceOwnver"

	<generated>
	<FMComment: 'My superclass'>
	<derived>
	^ interfaces
]

{ #category : #accessing }
FASTJavaClassDeclaration >> interfaces: anObject [

	<generated>
	interfaces value: anObject
]

{ #category : #navigation }
FASTJavaClassDeclaration >> interfacesGroup [
	<generated>
	<navigation: 'Interfaces'>
	^ MooseSpecializedGroup withAll: self interfaces asSet
]

{ #category : #accessing }
FASTJavaClassDeclaration >> sourceText [

	^ self source ifNil: [ self parentNode ifNil: [ '' ] ifNotNil: [ :existingParentNode | existingParentNode sourceText ] ]
]

{ #category : #accessing }
FASTJavaClassDeclaration >> superclass [
	"Relation named: #superclass type: #FASTJavaTypeExpression opposite: #javaClassDeclarationSuperclassOwnver"

	<generated>
	<FMComment: 'My superclass'>
	^ superclass
]

{ #category : #accessing }
FASTJavaClassDeclaration >> superclass: anObject [

	<generated>
	superclass := anObject
]

{ #category : #navigation }
FASTJavaClassDeclaration >> superclassGroup [
	<generated>
	<navigation: 'Superclass'>
	^ MooseSpecializedGroup with: self superclass
]
