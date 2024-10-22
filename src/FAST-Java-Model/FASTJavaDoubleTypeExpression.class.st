"
I represent a double type


"
Class {
	#name : 'FASTJavaDoubleTypeExpression',
	#superclass : 'FASTJavaPrimitiveTypeExpression',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaDoubleTypeExpression class >> annotation [

	<FMClass: #DoubleTypeExpression super: #FASTJavaPrimitiveTypeExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'testing' }
FASTJavaDoubleTypeExpression >> isDoubleTypeExpression [

	<generated>
	^ true
]
