"
A FASTJavaFieldAccess corresponds to an access to an instance variable (field)
"
Class {
	#name : #FASTJavaFieldAccess,
	#superclass : #FASTExpression,
	#traits : 'FASTJavaTAssigneable',
	#classTraits : 'FASTJavaTAssigneable classTrait',
	#instVars : [
		'#fieldName => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaFieldAccess class >> annotation [

	<MSEClass: #FieldAccess super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaFieldAccess class >> requirements [

	<generated>
	^ { FASTJavaAssignementExpression }
]

{ #category : #accessing }
FASTJavaFieldAccess >> fieldName [

	<MSEProperty: #fieldName type: #String>
	<generated>
	<MSEComment: 'Name of accessed field'>
	^ fieldName
]

{ #category : #accessing }
FASTJavaFieldAccess >> fieldName: anObject [

	<generated>
	fieldName := anObject

]
