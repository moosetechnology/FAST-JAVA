"
I represent an enum declaration
example

public enum MyEnum {
	
	HELLO;
	
	int oneDeclaration;
	
	void methodDeclaration(){
	}
}
"
Class {
	#name : #FASTJavaEnumDeclaration,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithModifiers + FASTTNamedEntity + FASTTStatement',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithModifiers classTrait + FASTTNamedEntity classTrait + FASTTStatement classTrait',
	#instVars : [
		'#interfaces => FMMany type: #FASTJavaTypeExpression opposite: #javaEnumDeclarationInterfaceOwnver'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaEnumDeclaration class >> annotation [

	<FMClass: #EnumDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTJavaEnumDeclaration >> addInterface: anObject [
	<generated>
	^ self interfaces add: anObject
]

{ #category : #accessing }
FASTJavaEnumDeclaration >> interfaces [
	"Relation named: #interfaces type: #FASTJavaTypeExpression opposite: #javaEnumDeclarationInterfaceOwnver"

	<generated>
	<FMComment: 'My superclass'>
	<derived>
	^ interfaces
]

{ #category : #accessing }
FASTJavaEnumDeclaration >> interfaces: anObject [

	<generated>
	interfaces value: anObject
]

{ #category : #navigation }
FASTJavaEnumDeclaration >> interfacesGroup [
	<generated>
	<navigation: 'Interfaces'>
	^ MooseSpecializedGroup withAll: self interfaces asSet
]
