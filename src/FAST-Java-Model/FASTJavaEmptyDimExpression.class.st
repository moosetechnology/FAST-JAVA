"
A node representing an empty expression when creating an array, for example:
	
	new String[] {""a""};
"
Class {
	#name : #FASTJavaEmptyDimExpression,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaEmptyDimExpression class >> annotation [

	<FMClass: #EmptyDimExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]
