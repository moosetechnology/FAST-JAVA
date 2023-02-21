Class {
	#name : #FASTJavaModel,
	#superclass : #MooseModel,
	#category : #'FAST-Java-Model-Model'
}

{ #category : #accessing }
FASTJavaModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' #'FAST-Core-Model')
]

{ #category : #meta }
FASTJavaModel class >> annotation [
	<FMClass: #FASTJavaModel super: #MooseModel>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : #testing }
FASTJavaModel class >> canBeImportedFromFile [
	<generated>
	^true
]
