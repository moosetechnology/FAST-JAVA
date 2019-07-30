Class {
	#name : #FASTJavaEntity,
	#superclass : #MooseEntity,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #testing }
FASTJavaEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaEntity >> isType [

	<generated>
	^ false
]
