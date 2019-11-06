"
I represent a Float Literal
example:

float f = 12.3;

12.3 is the float literal
"
Class {
	#name : #FASTJavaFloatLiteral,
	#superclass : #FASTLiteral,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaFloatLiteral class >> annotation [

	<FMClass: #FloatLiteral super: #FASTLiteral>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]
