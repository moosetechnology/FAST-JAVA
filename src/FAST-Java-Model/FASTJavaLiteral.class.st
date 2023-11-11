"
abtract class for all literals
"
Class {
	#name : #FASTJavaLiteral,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAnnotationElement + FASTJavaTReceiver',
	#classTraits : 'FASTJavaTAnnotationElement classTrait + FASTJavaTReceiver classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaLiteral class >> annotation [

	<FMClass: #Literal super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
