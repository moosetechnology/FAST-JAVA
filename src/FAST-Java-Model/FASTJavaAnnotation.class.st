"
I reprensent a Java Annotation

example:

@Override
"
Class {
	#name : #FASTJavaAnnotation,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTModifier + FASTTNamedEntity + FASTTWithArguments',
	#classTraits : 'FASTJavaTModifier classTrait + FASTTNamedEntity classTrait + FASTTWithArguments classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAnnotation class >> annotation [

	<FMClass: #Annotation super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
