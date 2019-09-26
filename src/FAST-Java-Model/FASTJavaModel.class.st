Class {
	#name : #FASTJavaModel,
	#superclass : #MooseModel,
	#category : #'FAST-Java-Model'
}

{ #category : #meta }
FASTJavaModel class >> annotation [
	<MSEClass: #FASTJavaModel super: #MooseModel>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : #initialization }
FASTJavaModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]
