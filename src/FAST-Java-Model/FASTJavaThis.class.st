"
A FASTJavaThis corresponds to 'this' in Java


"
Class {
	#name : 'FASTJavaThis',
	#superclass : 'FASTJavaVariableExpression',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaThis class >> annotation [

	<FMClass: #This super: #FASTJavaVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'testing' }
FASTJavaThis >> isThis [

	<generated>
	^ true
]
