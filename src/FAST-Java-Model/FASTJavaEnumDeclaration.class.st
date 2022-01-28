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
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaEnumDeclaration class >> annotation [

	<FMClass: #EnumDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]
