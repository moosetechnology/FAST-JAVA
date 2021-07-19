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
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithModifiers + FASTTNamedEntity + FASTTStatement + FamixTHasImmediateSource',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithModifiers classTrait + FASTTNamedEntity classTrait + FASTTStatement classTrait + FamixTHasImmediateSource classTrait',
	#instVars : [
		'#superclass => FMOne type: #FASTJavaTypeExpression opposite: #javaClassDeclarationSuperclassOwnver',
		'#interfaces => FMMany type: #FASTJavaTypeExpression opposite: #javaClassDeclarationInterfaceOwnver'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaClassDeclaration class >> annotation [

	<FMClass: #ClassDeclaration super: #FASTJavaEntity>
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
