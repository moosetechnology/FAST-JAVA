"
I reprensent a Java Annotation

example:

@Override
"
Class {
	#name : #FASTJavaAnnotation,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAnnotationElement + FASTJavaTModifier + FASTTNamedEntity',
	#classTraits : 'FASTJavaTAnnotationElement classTrait + FASTJavaTModifier classTrait + FASTTNamedEntity classTrait',
	#instVars : [
		'#elements => FMMany type: #FASTJavaTAnnotationElement opposite: #parentAnnotation'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaAnnotation class >> annotation [

	<FMClass: #Annotation super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTJavaAnnotation >> addElement: anObject [
	<generated>
	^ self elements add: anObject
]

{ #category : #accessing }
FASTJavaAnnotation >> elements [
	"Relation named: #elements type: #FASTJavaTAnnotationElement opposite: #parentAnnotation"

	<generated>
	<FMComment: '"Arguments" of the annotation, eg. this @Author annotation has two annotation elements:
	@Author(name="Benjamin Franklin", date="3/27/2003")'>
	<derived>
	^ elements
]

{ #category : #accessing }
FASTJavaAnnotation >> elements: anObject [

	<generated>
	elements value: anObject
]
