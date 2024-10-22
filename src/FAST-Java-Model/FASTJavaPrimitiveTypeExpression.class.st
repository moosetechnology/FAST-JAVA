"
I represent a primitive type


"
Class {
	#name : 'FASTJavaPrimitiveTypeExpression',
	#superclass : 'FASTJavaTypeExpression',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaPrimitiveTypeExpression class >> annotation [

	<FMClass: #PrimitiveTypeExpression super: #FASTJavaTypeExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'testing' }
FASTJavaPrimitiveTypeExpression >> isPrimitiveTypeExpression [

	<generated>
	^ true
]
