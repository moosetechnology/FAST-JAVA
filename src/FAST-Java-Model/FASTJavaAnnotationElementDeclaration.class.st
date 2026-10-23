"
I represent the declaration of an element of an annotation interface ([JLS 9.6.1](https://docs.oracle.com/javase/specs/jls/se17/html/jls-9.html#jls-9.6.1)): a method that takes no parameter, throws nothing, and may have a default value.
Example:
```language=text
public @interface MyAnnotation {
	String value() default ""none"";
}
```

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `defaultValue` | `FASTJavaAnnotationElementDeclaration` | `defaultValueOwner` | `FASTJavaTAnnotationElement` | The value I take when the annotation does not give one, eg. ""none"" in `String value() default ""none"";`|



"
Class {
	#name : 'FASTJavaAnnotationElementDeclaration',
	#superclass : 'FASTJavaMethodEntity',
	#instVars : [
		'#defaultValue => FMOne type: #FASTJavaTAnnotationElement opposite: #defaultValueOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaAnnotationElementDeclaration class >> annotation [

	<ignoreForCoverage>
	<FMClass: #AnnotationElementDeclaration super: #FASTJavaMethodEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaAnnotationElementDeclaration >> defaultValue [
	"Relation named: #defaultValue type: #FASTJavaTAnnotationElement opposite: #defaultValueOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The value I take when the annotation does not give one, eg. "none" in `String value() default "none";`'>
	^ defaultValue
]

{ #category : 'accessing' }
FASTJavaAnnotationElementDeclaration >> defaultValue: anObject [

	<ignoreForCoverage>
	<generated>
	defaultValue := anObject
]

{ #category : 'testing' }
FASTJavaAnnotationElementDeclaration >> isAnnotationElementDeclaration [

	<ignoreForCoverage>
	<generated>
	^ true
]
