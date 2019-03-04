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

{ #category : #generator }
FASTJavaEntity class >> generatedSlotNames [
	<generated>
	'FASTJavaEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaEntity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTJavaEntity class >> requirements [

	<generated>
	^ {  }
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
FASTJavaEntity >> isType [

	<generated>
	^ false
]
