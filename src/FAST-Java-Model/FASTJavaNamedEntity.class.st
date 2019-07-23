Class {
	#name : #FASTJavaNamedEntity,
	#superclass : #MooseEntity,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #MooseEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaNamedEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #testing }
FASTJavaNamedEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaNamedEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaNamedEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaNamedEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaNamedEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaNamedEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaNamedEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaNamedEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaNamedEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaNamedEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaNamedEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaNamedEntity >> isType [

	<generated>
	^ false
]
