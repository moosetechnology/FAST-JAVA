"
I represent an int type


"
Class {
	#name : 'FASTJavaIntTypeExpression',
	#superclass : 'FASTJavaPrimitiveTypeExpression',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaIntTypeExpression class >> annotation [

	<FMClass: #IntTypeExpression super: #FASTJavaPrimitiveTypeExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'testing' }
FASTJavaIntTypeExpression >> isIntTypeExpression [

	<generated>
	^ true
]
