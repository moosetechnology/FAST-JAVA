"
A node representing method imvocation
"
Class {
	#name : #FASTJavaMethodInvocation,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTReceiver + FASTJavaTWithReceiver + FASTTExpression + FASTTNamedEntity + FASTTWithArguments',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTJavaTWithReceiver classTrait + FASTTExpression classTrait + FASTTNamedEntity classTrait + FASTTWithArguments classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodInvocation class >> annotation [

	<FMClass: #MethodInvocation super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
