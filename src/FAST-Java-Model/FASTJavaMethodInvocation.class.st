"
A node representing method imvocation
"
Class {
	#name : #FASTJavaMethodInvocation,
	#superclass : #FASTExpression,
	#traits : 'FASTJavaTReceiver + FASTJavaTWithReceiver + FASTTWithArguments + FamixTNamed',
	#classTraits : 'FASTJavaTReceiver classTrait + FASTJavaTWithReceiver classTrait + FASTTWithArguments classTrait + FamixTNamed classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodInvocation class >> annotation [

	<FMClass: #MethodInvocation super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]
