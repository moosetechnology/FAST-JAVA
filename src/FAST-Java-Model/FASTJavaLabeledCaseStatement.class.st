"
I represent a Labeled case
	
ex.:

case LABEL:


"
Class {
	#name : 'FASTJavaLabeledCaseStatement',
	#superclass : 'FASTJavaCaseStatement',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaLabeledCaseStatement class >> annotation [

	<ignoreForCoverage>
	<FMClass: #LabeledCaseStatement super: #FASTJavaCaseStatement>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaLabeledCaseStatement >> isLabeledCaseStatement [

	<ignoreForCoverage>
	<generated>
	^ true
]
