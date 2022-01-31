"
I represent an interface declaration
example

```java
public interface MyInterface {

    public static final String CODE = ""SEME"";

}
```

"
Class {
	#name : #FASTJavaInterfaceDeclaration,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTDeclaration + FASTJavaTWithDeclarations + FASTJavaTWithModifiers + FASTTNamedEntity + FASTTStatement',
	#classTraits : 'FASTJavaTDeclaration classTrait + FASTJavaTWithDeclarations classTrait + FASTJavaTWithModifiers classTrait + FASTTNamedEntity classTrait + FASTTStatement classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaInterfaceDeclaration class >> annotation [

	<FMClass: #InterfaceDeclaration super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]
