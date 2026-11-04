"
I reprensent a Java Annotation

example:

@Override

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arrayOwner` | `FASTJavaTAnnotationElement` | `values` | `FASTJavaArrayAnnotationElement` | The ArrayAnnotationElement I am an element of|
| `defaultValueOwner` | `FASTJavaTAnnotationElement` | `defaultValue` | `FASTJavaAnnotationElementDeclaration` | The annotation element declaration I am the default value of|
| `javaAnnotationOwner` | `FASTJavaAnnotation` | `annotations` | `FASTJavaTWithAnnotations` | The element I am written on|
| `parentAnnotation` | `FASTJavaTAnnotationElement` | `elements` | `FASTJavaAnnotation` | An ""argument"" of an annotation, eg. ""unchecked"" in the following annotation: 	@SuppressWarnings(value=""unchecked"")|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `elements` | `FASTJavaAnnotation` | `parentAnnotation` | `FASTJavaTAnnotationElement` | ""Arguments"" of the annotation, eg. this @Author annotation has two annotation elements: 	@Author(name=""Benjamin Franklin"", date=""3/27/2003"")|
| `type` | `FASTJavaAnnotation` | `javaAnnotationTypeOwner` | `FASTJavaTypeName` | The type I am an instance of, eg. the `java.io.Serial` of `@java.io.Serial`|



"
Class {
	#name : 'FASTJavaAnnotation',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTAnnotationElement',
	#classTraits : 'FASTJavaTAnnotationElement classTrait',
	#instVars : [
		'#elements => FMMany type: #FASTJavaTAnnotationElement opposite: #parentAnnotation',
		'#javaAnnotationOwner => FMOne type: #FASTJavaTWithAnnotations opposite: #annotations',
		'#type => FMOne type: #FASTJavaTypeName opposite: #javaAnnotationTypeOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaAnnotation class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Annotation super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaAnnotation >> addElement: anObject [

	<ignoreForCoverage>
	<generated>
	^ self elements add: anObject
]

{ #category : 'accessing' }
FASTJavaAnnotation >> elements [
	"Relation named: #elements type: #FASTJavaTAnnotationElement opposite: #parentAnnotation"

	<ignoreForCoverage>
	<generated>
	<FMComment: '"Arguments" of the annotation, eg. this @Author annotation has two annotation elements:
	@Author(name="Benjamin Franklin", date="3/27/2003")'>
	<derived>
	^ elements
]

{ #category : 'accessing' }
FASTJavaAnnotation >> elements: anObject [

	<ignoreForCoverage>
	<generated>
	elements value: anObject
]

{ #category : 'testing' }
FASTJavaAnnotation >> isAnnotation [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaAnnotation >> javaAnnotationOwner [
	"Relation named: #javaAnnotationOwner type: #FASTJavaTWithAnnotations opposite: #annotations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The element I am written on'>
	<container>
	^ javaAnnotationOwner
]

{ #category : 'accessing' }
FASTJavaAnnotation >> javaAnnotationOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaAnnotationOwner := anObject
]

{ #category : 'accessing' }
FASTJavaAnnotation >> type [
	"Relation named: #type type: #FASTJavaTypeName opposite: #javaAnnotationTypeOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The type I am an instance of, eg. the `java.io.Serial` of `@java.io.Serial`'>
	^ type
]

{ #category : 'accessing' }
FASTJavaAnnotation >> type: anObject [

	<ignoreForCoverage>
	<generated>
	type := anObject
]
