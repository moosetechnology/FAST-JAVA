Class {
	#name : 'FASTJavaModel',
	#superclass : 'MooseModel',
	#traits : 'FASTJavaTEntityCreator + FASTTEntityCreator',
	#classTraits : 'FASTJavaTEntityCreator classTrait + FASTTEntityCreator classTrait',
	#category : 'FAST-Java-Model-Model',
	#package : 'FAST-Java-Model',
	#tag : 'Model'
}

{ #category : 'accessing' }
FASTJavaModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' #'FAST-Core-Model')
]

{ #category : 'meta' }
FASTJavaModel class >> annotation [

	<FMClass: #Model super: #MooseModel>
	<package: #'FAST-Java-Model'>
	<generated>
]
