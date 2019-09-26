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
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithModifiers + FamixTNamed',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithModifiers classTrait + FamixTNamed classTrait',
	#instVars : [
		'#interfaces => FMMany type: #FASTJavaTypeExpression opposite: #javaClassDeclarationInterfaceOwnver',
		'#superclass => FMOne type: #FASTJavaTypeExpression opposite: #javaClassDeclarationSuperclassOwnver'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaClassDeclaration class >> annotation [

	<MSEClass: #ClassDeclaration super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaClassDeclaration class >> requirements [

	<generated>
	^ { FASTJavaClassDeclaration }
]

{ #category : #adding }
FASTJavaClassDeclaration >> addInterfaces: anObject [
	<generated>
	^ self interfaces add: anObject
]

{ #category : #accessing }
FASTJavaClassDeclaration >> interfaces [
	"Relation named: #interfaces type: #FASTJavaTypeExpression opposite: #javaClassDeclarationInterfaceOwnver"

	<generated>
	<MSEComment: 'My superclass'>
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
	^ MooseGroup withAll: self interfaces asSet
]

{ #category : #accessing }
FASTJavaClassDeclaration >> superclass [
	"Relation named: #superclass type: #FASTJavaTypeExpression opposite: #javaClassDeclarationSuperclassOwnver"

	<generated>
	<MSEComment: 'My superclass'>
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
	^ MooseGroup with: self superclass
]
