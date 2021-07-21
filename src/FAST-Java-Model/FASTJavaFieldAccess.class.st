"
A FASTJavaFieldAccess corresponds to an access to an instance variable (field)
"
Class {
	#name : #FASTJavaFieldAccess,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAssigneable + FASTJavaTReceiver + FASTJavaTWithReceiver + FASTTExpression',
	#classTraits : 'FASTJavaTAssigneable classTrait + FASTJavaTReceiver classTrait + FASTJavaTWithReceiver classTrait + FASTTExpression classTrait',
	#instVars : [
		'#fieldName => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaFieldAccess class >> annotation [

	<FMClass: #FieldAccess super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaFieldAccess >> fieldName [

	<FMProperty: #fieldName type: #String>
	<generated>
	<FMComment: 'Name of accessed field'>
	^ fieldName
]

{ #category : #accessing }
FASTJavaFieldAccess >> fieldName: anObject [
	<generated>
	fieldName := anObject
]
