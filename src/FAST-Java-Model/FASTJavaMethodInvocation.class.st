"
A node representing method invocation
"
Class {
	#name : #FASTJavaMethodInvocation,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTReceiver + FASTJavaTWithReceiver + FASTTInvocation + FASTTNamedEntity',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTJavaTWithReceiver classTrait + FASTTInvocation classTrait + FASTTNamedEntity classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodInvocation class >> annotation [

	<FMClass: #MethodInvocation super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
