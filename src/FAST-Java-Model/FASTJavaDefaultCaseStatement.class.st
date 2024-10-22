"
I represent a default case
	
ex.:

default:


"
Class {
	#name : 'FASTJavaDefaultCaseStatement',
	#superclass : 'FASTJavaCaseStatement',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaDefaultCaseStatement class >> annotation [

	<FMClass: #DefaultCaseStatement super: #FASTJavaCaseStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'testing' }
FASTJavaDefaultCaseStatement >> isDefaultCaseStatement [

	<generated>
	^ true
]
