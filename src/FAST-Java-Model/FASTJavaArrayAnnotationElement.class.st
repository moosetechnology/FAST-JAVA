"
I represent an array as argument of an annotationExpression
"
Class {
	#name : #FASTJavaArrayAnnotationElement,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAnnotationElement + FASTTExpression',
	#classTraits : 'FASTJavaTAnnotationElement classTrait + FASTTExpression classTrait',
	#instVars : [
		'#values => FMMany type: #FASTJavaTAnnotationElement opposite: #arrayOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaArrayAnnotationElement class >> annotation [

	<FMClass: #ArrayAnnotationElement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTJavaArrayAnnotationElement >> addValue: anObject [
	<generated>
	^ self values add: anObject
]

{ #category : #accessing }
FASTJavaArrayAnnotationElement >> values [
	"Relation named: #values type: #FASTJavaTAnnotationElement opposite: #arrayOwner"

	<generated>
	<FMComment: 'Annotation elements in the Array'>
	<derived>
	^ values
]

{ #category : #accessing }
FASTJavaArrayAnnotationElement >> values: anObject [

	<generated>
	values value: anObject
]

{ #category : #navigation }
FASTJavaArrayAnnotationElement >> valuesGroup [
	<generated>
	<navigation: 'Values'>
	^ MooseSpecializedGroup withAll: self values asSet
]
