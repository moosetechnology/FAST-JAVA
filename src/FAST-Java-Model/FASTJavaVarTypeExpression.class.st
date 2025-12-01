"
I represent a var type (type inference)


"
Class {
	#name : 'FASTJavaVarTypeExpression',
	#superclass : 'FASTJavaEntity',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaVarTypeExpression class >> annotation [

	<FMClass: #VarTypeExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'testing' }
FASTJavaVarTypeExpression >> isVarTypeExpression [

	<generated>
	^ true
]
